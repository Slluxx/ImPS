Examples
========

The most basic example, a plain window with no content (not really useful though):

.. code-block::
    
    using module ".\ImPS.psm1"

    [ImPS]::new().add_window("ImPS Window", 285, 75).show()



A slightly more useful example, a window with a label:

.. code-block::

    using module ".\ImPS.psm1"

    $ImPS = [ImPS]::new()
    $window = $ImPS.add_window("ImPS Window", 285, 75)
    $window.Elements.add_Label("This is almost like ImGUI", 20,20)
    $window.show()

This example creates a window with a button that generates a new GUID and displays it in a text box:

.. code-block::

    using module ".\ImPS.psm1"
    
    $ImPS = [ImPS]::new()
    $window = $ImPS.add_window("GUID Generator", 260, 90)

    $tbx = $window.Elements.add_TextBox("", 20, 20)
    $tbx.Drawable.width = 220

    $btn = $window.Elements.add_Button("Generate UUID", 19, 45)
    $btn.Drawable.width = 222
    $btn.onClick({
        $tbx.Drawable.Text = [guid]::newGuid()
    })

    $window.show()