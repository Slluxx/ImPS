# ImPS
ImPS is a simple wrapper to use WPF components in your script without writing massive amounts of UI code or using XML layouts. It is heavily inspired by ImGUI/DearPyGui to make it as easy as possible to use while keeping the configurability.

Please have in mind that this is in active development and, while usable, should not be used in any kind of production environment.

## Comparison

Here is the code you would need to write for a very basic window + label:
```ps
Add-Type -AssemblyName System.Windows.Forms

$Window = New-Object System.Windows.Forms.Form
$Window.ClientSize = "285,75"
$Window.Text = "ImPS Window"
$Window.BackColor = "#ffffff"
$Window.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen

$Label = New-Object System.Windows.Forms.label
$Label.Text = "This is almost like ImGUI"
$Label.AutoSize=$true
$Label.Font="Verdana,8,style=Regular"
$Label.Location=New-Object System.Drawing.Point(20,20)

$Window.Controls.Add($Label)

$Window.ShowDialog()
$Window.Dispose()
```

Here is ImPS's code for the exact same:
```PS
using module ".\ImPS.psm1"

$window = [ImPS]::new("ImPS Window", 285, 75)
$window.add_Label("This is almost like ImGUI", 20, 20)
$window.show()
```

## Advanced usage

ImPS is written for you to easily chain commands if desired:

```PS
$window.add_Label("My bold label", 20, 20).set_font("Verdana,8,style=Bold")
# or
$label = $window.add_Label("My italic label", 20, 40)
$label.set_font("Verdana,8,style=Italic")
```

Button onClick-handler work inline or as defined function:

```ps

$btn = $window.add_Button("Click me", 20, 20).onClick({
    write-host "Got clicked"
})
# or
$myfunc = { write-host "Got clicked" }
$btn = $window.add_Button("Click me", 20, 20).onClick($myfunc)

```