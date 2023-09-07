using module ".\ImPS.psm1"

$window = [ImPS]::new("ImPS Window", 285, 75)
$window.add_Label("This is almost like ImGUI", 20, 20)
$window.show()