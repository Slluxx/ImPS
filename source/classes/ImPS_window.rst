.. _ImPS-Window:

ImPS_Window
===========

.. class:: ImPS_Window($title, $width, $height)
.. attention::
    This class is not intended to be initialized directly.

:Parameters:    
                - **$title** ([string]) - The title of the window.
                - **$width** ([int]) - The width of the window.
                - **$height** ([int]) - The height of the window.
:Attributes:    
                - **Elements** ([:ref:`ImPS-Elements`])
                - **Panels** ([:ref:`ImPS-Panels`])
                - **Drawable** (`[System.Windows.Forms.Forms] <https://learn.microsoft.com/de-de/dotnet/api/system.windows.forms.form?view=windowsdesktop-7.0#properties>`_)
:Returns:       
                - [:ref:`ImPS-Window`]

.. function:: show()

    Shows the window after all elements have been added.

:Parameters:    None
:Returns:       None