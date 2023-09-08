.. _ImPS-Elements-TextBox:

ImPS_Elements_TextBox
=====================

.. class:: ImPS_Elements_TextBox(text, $pos_x, pos_y)
.. attention::
    This class is not intended to be initialized directly.
.. note::
    This class inherits from :ref:`ImPS-Elements-Base`.

:Parameters:    
                - **$text** ([string]) - The text inside the TextBox.
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.
:Attributes:    
                - **Drawable** (`[System.Windows.Forms.TextBox] <https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.textbox?view=windowsdesktop-7.0#properties>`_)
:Returns:       - [:ref:`ImPS-Elements-TextBox`]



.. function:: set_size($height, $width)

:Parameters:    
                - **$height** ([int])
                - **$width** ([int])
:Returns:        - [:ref:`ImPS-Elements-ListBox`]



.. function:: set_multiline($multiline)

:Parameters:    
                - **$multiline** ([bool])
:Returns:        - [:ref:`ImPS-Elements-ListBox`]



.. function:: set_scrollbars($type)

:Parameters:    
                - **$type** ([:ref:`ScrollBars`]) enum
:Returns:        - [:ref:`ImPS-Elements-ListBox`]

