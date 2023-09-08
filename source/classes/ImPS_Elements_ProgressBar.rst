.. _ImPS-Elements-ProgressBar:

ImPS_Elements_ProgressBar
=========================

.. class:: ImPS_Elements_ProgressBar($value, $pos_x, $pos_y)
.. attention::
    This class is not intended to be initialized directly.
.. note::
    This class inherits from :ref:`ImPS-Elements-Base`.

:Parameters:    
                - **$value** ([int]) - The value of the ProgressBar in percent (eg: 25 = 25%).
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.
:Attributes:    
                - **Drawable** (`[System.Windows.Forms.ProgressBar] <https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.progressbar?view=windowsdesktop-7.0#properties>`_)
:Returns:       - [:ref:`ImPS-Elements-ProgressBar`]



.. function:: get_value()

:Parameters:    None
:Returns:        - [int] - The value of the ProgressBar (0-100).



.. function:: set_value($value)

:Parameters:    
                - **$value** ([int]) - The value of the ProgressBar in percent (eg: 25 = 25%).
:Returns:       - [:ref:`ImPS-Elements-ProgressBar`]

