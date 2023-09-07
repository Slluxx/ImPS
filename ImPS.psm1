Add-Type -AssemblyName System.Windows.Forms

# https://stackoverflow.com/questions/41475205/how-to-output-value-from-function-to-caller-but-not-to-console
# https://renenyffenegger.ch/notes/Windows/PowerShell/command-inventory/noun/default/out
function out-default {
    param ([parameter (valueFromPipeline=$true)] $val)
    begin  {}
    process{}
}


class ImPS {
    [System.Windows.Forms.Form] $Window
    [hashtable] $Drawables = @{}


    ImPS([string]$title, [int]$width=300, [int]$height=150) {
        [System.Windows.Forms.Application]::EnableVisualStyles();
        $this.Window = New-Object System.Windows.Forms.Form
        $this.Window.ClientSize = "$($width),$($height)"
        $this.Window.Text = $title
        $this.Window.BackColor = "#ffffff"
        $this.Window.StartPosition = [FormStartPosition]::CenterScreen
        #$this.Window.TopMost = $true
    }
    [ImPS] window_setTitle([string]$title){$this.Window.Text = $title; return $this}
    [ImPS] window_setClientSize([int]$width=300, [int]$height=150){$this.Window.ClientSize = "$($width),$($height)"; return $this}
    [ImPS] window_setBackColor([string]$color){$this.Window.BackColor = $color; return $this}
    [ImPS] window_setStartPosition([FormStartPosition]$position){ # does not seem to work
        $this.Window.StartPosition = $position
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

    [ImPS_TextBox] add_TextBox([string]$text,[int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_TextBox]::new($text, $pos_x, $pos_y)
        $this.Window.Controls.Add($Instance.get_Drawable())
        $this.Drawables[$Instance.get_Guid()] = $Instance
        return $Instance
    }

    [ImPS_ProgressBar] add_ProgressBar([int]$value,[int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_ProgressBar]::new($value, $pos_x, $pos_y)
        $this.Window.Controls.Add($Instance.get_Drawable())
        $this.Drawables[$Instance.get_Guid()] = $Instance
        return $Instance
    }
    
    [ImPS_ComboBox] add_ComboBox([int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_ComboBox]::new($pos_x, $pos_y)
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
    [string] get_text(){
        return $this.Drawable.Text
    }
    [object] set_height([int]$height){
        $this.Drawable.Height = $height
        return $this
    }
    [int] get_height(){
        return $this.Drawable.Height
    }
    [object] set_width([int]$width){
        $this.Drawable.Width = $width
        return $this
    }
    [int] get_width(){
        return $this.Drawable.Width
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
    [ImPS_Checkbox] set_checked([bool]$checked){
        $this.Drawable.Checked = $checked
        return $this
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
    [ImPS_Button] onClick([scriptblock] $fn){
        $this.Drawable.Add_Click($fn)
        return $this
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

class ImPS_TextBox : ImPS_Drawable {
    [System.Windows.Forms.TextBox] $Drawable
    [guid] $Guid

    ImPS_TextBox([string]$text,[int]$pos_x, [int]$pos_y) {
        $this.Guid = [guid]::NewGuid()
        $this.Drawable = New-Object System.Windows.Forms.TextBox
        $this.Drawable.Text = $text
        $this.Drawable.Location=New-Object System.Drawing.Point($pos_x,$pos_y)
        $this.Drawable.AutoSize=$true
        $this.Drawable.p
    }
    [ImPS_TextBox] set_size([int]$height, [int]$width){
        $this.Drawable.Size = New-Object System.Drawing.Size($width,$height)
        return $this
    }
    [ImPS_TextBox] set_multiline([bool]$multiline){
        $this.Drawable.Multiline = $multiline
        return $this
    }
    [ImPS_TextBox] set_acceptsReturn([bool]$acceptsReturn){
        $this.Drawable.Multiline = $acceptsReturn
        return $this
    }
    [ImPS_TextBox] set_scrollbars([ScrollBars]$type){ 
        $this.Drawable.ScrollBars = $type
        return $this
    }
}

class ImPS_ProgressBar : ImPS_Drawable {
    [System.Windows.Forms.ProgressBar] $Drawable
    [guid] $Guid

    ImPS_ProgressBar([int]$value, [int]$pos_x, [int]$pos_y){
        $this.Guid = [guid]::NewGuid()
        $this.Drawable = New-Object System.Windows.Forms.ProgressBar
        $this.Drawable.Value = $value
        $this.Drawable.Style = "Continuous"
        $this.Drawable.MarqueeAnimationSpeed = 80
        $this.Drawable.AutoSize=$true
        $this.Drawable.Location=New-Object System.Drawing.Point($pos_x,$pos_y)
    }
    [int] get_value(){
        return $this.Drawable.Value
    }
    [ImPS_ProgressBar] set_value([int]$value){
        $this.Drawable.Value = $value
        return $this
    }

}

class ImPS_ComboBox  : ImPS_Drawable {
    [System.Windows.Forms.ComboBox] $Drawable
    [guid] $Guid
    ImPS_ComboBox([int]$pos_x, [int]$pos_y) {
        $this.Guid = [guid]::NewGuid()
        $this.Drawable = New-Object System.Windows.Forms.ComboBox
        $this.Drawable.Location = New-Object System.Drawing.Point($pos_x,$pos_y)
        $this.Drawable.AutoSize=$true
    }
    [System.Windows.Forms.ComboBox+ObjectCollection] ComboBoxItem(){
        return $this.Drawable.Items
    }
    [ImPS_ComboBox] set_selection([int]$index){
        $this.Drawable.SelectedIndex = $index
        return $this
    }
    [int] get_selectionIndex(){
        return $this.Drawable.SelectedIndex
    }
    [ImPS_ComboBox] set_selection([string]$value){
        $this.Drawable.SelectedItem = $value
        return $this
    }
    [string] get_selectionValue(){
        return $this.Drawable.SelectedItem
    }
    
}


enum ScrollBars { #https://learn.microsoft.com/de-de/dotnet/api/system.windows.forms.scrollbars?view=windowsdesktop-7.0
    None = 0
    Horizontal
    Vertical
    Both
}

enum FormStartPosition { # https://learn.microsoft.com/de-de/dotnet/api/system.windows.forms.formstartposition?view=windowsdesktop-7.0
    Manual = 0
    CenterScreen
    WindowsDefaultLocation
    WindowsDefaultBounds
    CenterParent
}