Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[System.Windows.Forms.Application]::EnableVisualStyles()

# https://stackoverflow.com/questions/41475205/how-to-output-value-from-function-to-caller-but-not-to-console
# https://renenyffenegger.ch/notes/Windows/PowerShell/command-inventory/noun/default/out
function out-default {
    param ([parameter (valueFromPipeline=$true)] $val)
    begin  {}
    process{}
}

class ImPS {
    [ImPS_Window] add_window([string]$title, [int]$width, [int]$height){
        $Instance = [ImPS_Window]::new($title, $width, $height)
        return $Instance
    }
}

class ImPS_Window {
    [System.Windows.Forms.Form] $Drawable
    [object] $Elements
    [object] $Panels
    
    ImPS_Window([string]$title, [int]$width, [int]$height){
        $this.Elements = [ImPS_Elements]::new($this)
        $this.Panels = [ImPS_Panels]::new($this)

        $this.Drawable = New-Object System.Windows.Forms.Form
        $this.Drawable.ClientSize = "$($width),$($height)"
        $this.Drawable.Text = $title
        $this.Drawable.BackColor = "#ffffff"
        $this.Drawable.StartPosition = 1
    }

    show(){
        $this.Drawable.ShowDialog()
        $this.Drawable.Dispose()
    }
}

class ImPS_Elements { # class to create elements into a parent
    [object] $Parent
    ImPS_Elements([object]$parent){
        $this.Parent = $parent
    }
    [ImPS_Elements_Label] add_Label([string]$text, [int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Elements_Label]::new($text, $pos_x, $pos_y)
        $this.Parent.Drawable.Controls.Add($Instance.get_Drawable())
        return $Instance
    }
    [ImPS_Elements_Checkbox] add_Checkbox([bool]$checked, [int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Elements_Checkbox]::new($checked, $pos_x, $pos_y)
        $this.Parent.Drawable.Controls.Add($Instance.get_Drawable())
        return $Instance
    }

    [ImPS_Elements_Button] add_Button([string]$text, [int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Elements_Button]::new($text, $pos_x, $pos_y)
        $this.Parent.Drawable.Controls.Add($Instance.get_Drawable())
        return $Instance
    }

    [ImPS_Elements_ListBox] add_ListBox([int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Elements_ListBox]::new($pos_x, $pos_y)
        $this.Parent.Drawable.Controls.Add($Instance.get_Drawable())
        return $Instance
    }

    [ImPS_Elements_TextBox] add_TextBox([string]$text, [int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Elements_TextBox]::new($text, $pos_x, $pos_y)
        $this.Parent.Drawable.Controls.Add($Instance.get_Drawable())
        return $Instance
    }

    [ImPS_Elements_ProgressBar] add_ProgressBar([int]$value, [int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Elements_ProgressBar]::new($value, $pos_x, $pos_y)
        $this.Parent.Drawable.Controls.Add($Instance.get_Drawable())
        return $Instance
    }
    
    [ImPS_Elements_ComboBox] add_ComboBox([int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Elements_ComboBox]::new($pos_x, $pos_y)
        $this.Parent.Drawable.Controls.Add($Instance.get_Drawable())
        return $Instance
    }
}

class ImPS_Panels { # class to create Panels
    [object] $Parent

    ImPS_Panels([object]$parent){
        $this.Parent = $parent
    }
    
    [ImPS_Panels_TableLayoutPanel] add_TableLayoutPanel([int]$cols, [int]$rows, [int]$pos_x, [int]$pos_y){
        $Instance = [ImPS_Panels_TableLayoutPanel]::new($cols, $rows, $pos_x, $pos_y)
        $this.Parent.Drawable.Controls.Add($Instance.get_Drawable())
        return $Instance
    }
}

class ImPS_Elements__Base { # base class for shared methods of Elements
    
    [object] get_Drawable(){
        return $this.Drawable
    }
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
    
    [object]set_attr([string]$attr, $value){
        if (Get-Member -inputobject $this.Drawable -name $attr -Membertype Properties) {
            $this.Drawable.$attr = $value
        } else {
            Write-Host "Attribute $attr not found in $($this.Drawable)"
        }
        return $this
    }

}

class ImPS_Panels__Base { # base class for shared methods of Panels
    [object] get_Drawable(){
        return $this.Drawable
    }
    [object] set_DockStyle([DockStyle]$mode){
        $this.Drawable.Dock = $mode
        return $this
    }
}

class ImPS_Elements_Label : ImPS_Elements__Base {
    [System.Windows.Forms.Label] $Drawable
    ImPS_Elements_Label([string]$text, [int]$pos_x, [int]$pos_y) {
        $this.Drawable = New-Object System.Windows.Forms.label
        $this.Drawable.Text = $text
        $this.Drawable.AutoSize=$true
        $this.Drawable.Font="Verdana,8,style=Regular"
        $this.Drawable.Location=New-Object System.Drawing.Point($pos_x,$pos_y)
    }
}


class ImPS_Elements_Checkbox : ImPS_Elements__Base {
    [System.Windows.Forms.CheckBox] $Drawable

    ImPS_Elements_Checkbox([bool]$checked, [int]$pos_x, [int]$pos_y){
        $this.Drawable = New-Object System.Windows.Forms.CheckBox
        $this.Drawable.Checked=$checked
        $this.Drawable.AutoSize=$true
        $this.Drawable.Location=New-Object System.Drawing.Point($pos_x,$pos_y)
    }

    [bool] get_checked(){
        return $this.Drawable.Checked
    }
    [ImPS_Elements_Checkbox] set_checked([bool]$checked){
        $this.Drawable.Checked = $checked
        return $this
    }
}

class ImPS_Elements_Button : ImPS_Elements__Base {
    [System.Windows.Forms.Button] $Drawable

    ImPS_Elements_Button([string]$text, [int]$pos_x, [int]$pos_y){
        $this.Drawable = New-Object System.Windows.Forms.Button
        $this.Drawable.Text = $text
        $this.Drawable.AutoSize=$true
        $this.Drawable.Location=New-Object System.Drawing.Point($pos_x,$pos_y)
    }
    [ImPS_Elements_Button] onClick([scriptblock] $fn){
        $this.Drawable.Add_Click($fn)
        return $this
    }
}

class ImPS_Elements_ListBox : ImPS_Elements__Base {
    [System.Windows.Forms.ListBox] $Drawable

    ImPS_Elements_ListBox([int]$pos_x, [int]$pos_y) {
        $this.Drawable = New-Object System.Windows.Forms.ListBox
        $this.Drawable.Location = New-Object System.Drawing.Point($pos_x,$pos_y)
        $this.Drawable.AutoSize=$true
    }
    [System.Windows.Forms.ListBox+ObjectCollection]ListBoxItem(){
        return $this.Drawable.Items
    }
    [ImPS_Elements_ListBox]set_selected([int]$index, [bool]$selected){
        $this.Drawable.SetSelected($index, $selected)
        return $this
    }
    [bool]get_selected([int]$index){
        return $this.Drawable.GetSelected($index)
    }
}

class ImPS_Elements_TextBox : ImPS_Elements__Base {
    [System.Windows.Forms.TextBox] $Drawable

    ImPS_Elements_TextBox([string]$text,[int]$pos_x, [int]$pos_y) {
        $this.Drawable = New-Object System.Windows.Forms.TextBox
        $this.Drawable.Text = $text
        $this.Drawable.Location=New-Object System.Drawing.Point($pos_x,$pos_y)
        $this.Drawable.AutoSize=$true
    }
    [ImPS_Elements_TextBox] set_size([int]$height, [int]$width){
        $this.Drawable.Size = New-Object System.Drawing.Size($width,$height)
        return $this
    }
    [ImPS_Elements_TextBox] set_multiline([bool]$multiline){
        $this.Drawable.Multiline = $multiline
        return $this
    }
    [ImPS_Elements_TextBox] set_scrollbars([ScrollBars]$type){ 
        $this.Drawable.ScrollBars = $type
        return $this
    }
}

class ImPS_Elements_ProgressBar : ImPS_Elements__Base {
    [System.Windows.Forms.ProgressBar] $Drawable

    ImPS_Elements_ProgressBar([int]$value, [int]$pos_x, [int]$pos_y){
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
    [ImPS_Elements_ProgressBar] set_value([int]$value){
        $this.Drawable.Value = $value
        return $this
    }

}

class ImPS_Elements_ComboBox  : ImPS_Elements__Base {
    [System.Windows.Forms.ComboBox] $Drawable
    ImPS_Elements_ComboBox([int]$pos_x, [int]$pos_y) {
        $this.Drawable = New-Object System.Windows.Forms.ComboBox
        $this.Drawable.Location = New-Object System.Drawing.Point($pos_x,$pos_y)
        $this.Drawable.AutoSize=$true
    }
    [System.Windows.Forms.ComboBox+ObjectCollection] ComboBoxItem(){
        return $this.Drawable.Items
    }
    [ImPS_Elements_ComboBox] set_selection([int]$index){
        $this.Drawable.SelectedIndex = $index
        return $this
    }
    [int] get_selectionIndex(){
        return $this.Drawable.SelectedIndex
    }
    [ImPS_Elements_ComboBox] set_selection([string]$value){
        $this.Drawable.SelectedItem = $value
        return $this
    }
    [string] get_selectionValue(){
        return $this.Drawable.SelectedItem
    }
    
}

class ImPS_Panels_TableLayoutPanel : ImPS_Panels__Base {
    [System.Windows.Forms.TableLayoutPanel] $Drawable
    [object] $Elements
    [object] $Panels

    ImPS_Panels_TableLayoutPanel([int]$cols, [int]$rows, [int]$pos_x, [int]$pos_y){
        $this.Elements = [ImPS_Elements]::new($this)
        $this.Panels = [ImPS_Panels]::new($this)

        $this.Drawable = New-Object System.Windows.Forms.TableLayoutPanel
        $this.Drawable.Location = New-Object System.Drawing.Point($pos_x,$pos_y)
        $this.Drawable.AutoSize=$true
        $this.Drawable.ColumnCount = $cols
        $this.Drawable.RowCount = $rows
        $this.Drawable.CellBorderStyle = "single"
    }

    [ImPS_Panels_TableLayoutPanel] add_ColumnStyle([int]$percent){
        $this.Drawable.ColumnStyles.Add((new-object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, $percent)))
        return $this
    }
    [ImPS_Panels_TableLayoutPanel] add_RowStyle([int]$percent){
        $this.Drawable.RowStyles.Add((new-object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Percent, $percent)))
        return $this
    }
    [ImPS_Panels_TableLayoutPanel] set_CellBorderStyle([BorderStyle]$style){
        $this.Drawable.CellBorderStyle = $style
        return $this
    }
    [ImPS_Panels_TableLayoutPanel] set_ColumnCount([int]$count){
        $this.Drawable.ColumnCount = $count
        return $this
    }
    [ImPS_Panels_TableLayoutPanel] set_RowCount([int]$count){
        $this.Drawable.RowCount = $count
        return $this
    }
}

enum DockStyle {
    None = 0
    Top
    Bottom
    Left
    Right
    Fill
}

enum BorderStyle {
    None = 0
    FixedSingle
    Fixed3D
}

enum ScrollBars {
    None = 0
    Horizontal
    Vertical
    Both
}

enum FormStartPosition {
    Manual = 0
    CenterScreen
    WindowsDefaultLocation
    WindowsDefaultBounds
    CenterParent
}