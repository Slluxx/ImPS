.. _ImPS-Elements-Checkbox:

ImPS_Elements_Checkbox
======================

.. class:: ImPS_Elements_Checkbox($checked, $pos_x, $pos_y)
.. attention::
    This class is not intended to be initialized directly.
.. note::
    This class inherits from :ref:`ImPS-Elements-Base`.

:Parameters:    
                - **$checked** ([bool]) - The state of the Checkbox (Ticked/Unticked).
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.
:Attributes:    
                - **Drawable** (`[System.Windows.Forms.Checkbox] <https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.checkbox?view=windowsdesktop-7.0#properties>`_)
:Returns:       - [:ref:`ImPS-Elements-Checkbox`]



.. function:: get_checked()

:Parameters:    None
:Returns:       - [bool]



.. function:: set_checked($checked)

:Parameters:
                - **$checked** ([bool]) - The state of the Checkbox (Ticked/Unticked).
:Returns:       - [:ref:`ImPS-Elements-Checkbox`]