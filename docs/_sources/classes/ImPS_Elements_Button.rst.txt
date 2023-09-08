.. _ImPS-Elements-Button:

ImPS_Elements_Button
====================

.. class:: ImPS_Elements_Button($text, $pos_x, $pos_y)
.. attention::
    This class is not intended to be initialized directly.
.. note::
    This class inherits from :ref:`ImPS-Elements-Base`.

:Parameters:    
                - **$text** ([string]) - The Button text.
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.
:Attributes:    
                - **Drawable** (`[System.Windows.Forms.Button] <https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.button?view=windowsdesktop-7.0#properties>`_)
:Returns:       - [:ref:`ImPS-Elements-Button`]



.. function:: onClick($fn)

:Parameters:    
                - **$fn** ([scriptblock]) - A function to execute when the button has been clicked.
:Returns:        - [:ref:`ImPS-Elements-Button`]