Add-Type -AssemblyName System.Windows.Forms
Remove-Item function:Out-Default # https://stackoverflow.com/questions/41475205/how-to-output-value-from-function-to-caller-but-not-to-console

class ImPS {
    [System.Windows.Forms.Form] $Window
    [hashtable] $Drawables = @{}


    ImPS([string]$title, [int]$width=300, [int]$height=150) {
        $this.Window = New-Object System.Windows.Forms.Form
        $this.Window.ClientSize = "$($width),$($height)"
        $this.Window.Text = $title
        $this.Window.BackColor = "#ffffff"
        $this.Window.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
        #$this.Window.TopMost = $true
    }
    [ImPS] window_setTitle([string]$title){$this.Window.Text = $title; return $this}
    [ImPS] window_setClientSize([int]$width=300, [int]$height=150){$this.Window.ClientSize = "$($width),$($height)"; return $this}
    [ImPS] window_setBackColor([string]$color){$this.Window.BackColor = $color; return $this}
    [ImPS] window_setStartPosition([int]$position){
        switch ($position)                         
        {                        
            0 {$this.Window.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterParent}                        
            1 {$this.Window.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen}
            2 {$this.Window.StartPosition = [System.Windows.Forms.FormStartPosition]::Manual} 
            3 {$this.Window.StartPosition = [System.Windows.Forms.FormStartPosition]::WindowsDefaultBounds} 
            4 {$this.Window.StartPosition = [System.Windows.Forms.FormStartPosition]::WindowsDefaultLocation}                        
            Default {}                        
        } 
        return $this
    }


    show(){
        $this.Window.ShowDialog()
        $this.Window.Dispose()
    }

    [ImPS_Label] add_Label([string]$text, [int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Label]::new($text, $pos_x, $pos_y)
        $this.Window.Controls.Add($Instance.get_Drawable())
        $this.Drawables[$Instance.get_Guid()] = $Instance
        return $Instance
    }

    [ImPS_Checkbox] add_Checkbox([bool]$checked, [int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Checkbox]::new($checked, $pos_x, $pos_y)
        $this.Window.Controls.Add($Instance.get_Drawable())
        $this.Drawables[$Instance.get_Guid()] = $Instance
        return $Instance
    }

    [ImPS_Button] add_Button([string]$text, [int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Button]::new($text, $pos_x, $pos_y)
        $this.Window.Controls.Add($Instance.get_Drawable())
        $this.Drawables[$Instance.get_Guid()] = $Instance
        return $Instance
    }

    [ImPS_ListBox] add_ListBox([int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_ListBox]::new($pos_x, $pos_y)
        $this.Window.Controls.Add($Instance.get_Drawable())
        $this.Drawables[$Instance.get_Guid()] = $Instance
        return $Instance
    }
    
}

class ImPS_Drawable{
    [guid] get_Guid(){ return $this.Guid }
    [object] get_drawable(){ return $this.Drawable }
    [object] set_font([string]$font){ 
        $this.Drawable.font = $font
        return $this
    }
    [object] set_pos([int]$x, [int]$y){ 
        $this.Drawable.Location = New-Object System.Drawing.Point($x,$y)
        return $this
    }
    [object] set_text([string]$text){
        $this.Drawable.Text = $text
        return $this
    }
    [object] set_height([int]$height){
        $this.Drawable.Height = $height
        return $this
    }
    [object] set_width([int]$width){
        $this.Drawable.Width = $width
        return $this
    }
}

class ImPS_Label : ImPS_Drawable {
    [System.Windows.Forms.Label] $Drawable
    [guid] $Guid

    ImPS_Label([string]$text, [int]$pos_x, [int]$pos_y) {
        $this.Guid = [guid]::NewGuid()

        $this.Drawable = New-Object System.Windows.Forms.label
        $this.Drawable.Text = $text
        $this.Drawable.AutoSize=$true
        $this.Drawable.Font="Verdana,8,style=Regular"
        $this.Drawable.Location=New-Object System.Drawing.Point($pos_x,$pos_y)
    }
}

class ImPS_Checkbox : ImPS_Drawable {
    [System.Windows.Forms.CheckBox] $Drawable
    [guid] $Guid

    ImPS_Checkbox([bool]$checked, [int]$pos_x, [int]$pos_y){
        $this.Guid = [guid]::NewGuid()
        $this.Drawable = New-Object System.Windows.Forms.CheckBox
        $this.Drawable.Checked=$true
        $this.Drawable.AutoSize=$true
        $this.Drawable.Location=New-Object System.Drawing.Point($pos_x,$pos_y)
    }

    [bool] get_checked(){
        return $this.Drawable.Checked
    }
}

class ImPS_Button : ImPS_Drawable {
    [System.Windows.Forms.Button] $Drawable
    [guid] $Guid

    ImPS_Button([string]$text, [int]$pos_x, [int]$pos_y){
        $this.Guid = [guid]::NewGuid()
        $this.Drawable = New-Object System.Windows.Forms.Button
        $this.Drawable.Text = $text
        $this.Drawable.AutoSize=$true
        $this.Drawable.Location=New-Object System.Drawing.Point($pos_x,$pos_y)
    }

    [void] onClick([scriptblock] $fn){
        $this.Drawable.Add_Click($fn)
    }
}

class ImPS_ListBox : ImPS_Drawable {
    [System.Windows.Forms.ListBox] $Drawable
    [guid] $Guid
    ImPS_ListBox([int]$pos_x, [int]$pos_y) {
        $this.Guid = [guid]::NewGuid()
        $this.Drawable = New-Object System.Windows.Forms.ListBox
        $this.Drawable.Location = New-Object System.Drawing.Point($pos_x,$pos_y)
        $this.Drawable.AutoSize=$true
    }
    [System.Windows.Forms.ListBox+ObjectCollection]ListBoxItem(){
        return $this.Drawable.Items
    }
}



    <#
        .SYNOPSIS
        Adds a file name extension to a supplied name.

        .DESCRIPTION
        Adds a file name extension to a supplied name.
        Takes any strings for the file name or extension.

        .PARAMETER Name
        Specifies the file name.

        .PARAMETER Extension
        Specifies the extension. "Txt" is the default.

        .INPUTS
        None. You can't pipe objects to Add-Extension.

        .OUTPUTS
        System.String. Add-Extension returns a string with the extension or file name.

        .EXAMPLE
        PS> extension -name "File"
        File.txt

        .EXAMPLE
        PS> extension -name "File" -extension "doc"
        File.doc

        .EXAMPLE
        PS> extension "File" "doc"
        File.doc

        .LINK
        Online version: http://www.fabrikam.com/extension.html

        .LINK
        Set-Item
    #>