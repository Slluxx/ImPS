using module ".\ImPS.psm1"

$ImPS = [ImPS]::new()
$window = $ImPS.add_window("ImPS Window", 300, 350)

$pannel = $window.Pannels.add_TableLayoutPanel(2,2, 20,20)
$pannel.add_ColumnStyle(50).add_ColumnStyle(50).add_RowStyle(50).add_RowStyle(50)

$pannel.Elements.add_Label("A", 20,20)
$pannel.Elements.add_Label("B", 20,20)
$pannel.Elements.add_Label("C", 20,20)
$pannel.Elements.add_Button("D", 20,20)

$window.Elements.add_Checkbox($true, 20, 150)
$window.Elements.add_TextBox("Text", 20, 180).set_width(250)
$window.Elements.add_ProgressBar(50, 20, 210).set_width(250)

$comboBox = $window.Elements.add_ComboBox(20, 240).set_width(250)
$comboBox.ComboBoxItem().Add("AA")
$comboBox.ComboBoxItem().Add("BB")
$comboBox.ComboBoxItem().Add("CC")
$comboBox.set_selection(0)

$lb = $window.Elements.add_ListBox(20, 270).set_width(250).set_height(10)
$lb.ListBoxItem().Add("A")
$lb.ListBoxItem().Add("B")
$lb.ListBoxItem().Add("C")
$lb.set_selected(1, $true)

$window.show()