.. _ImPS-Elements-ListBox:

ImPS_Elements_ListBox
=====================

.. class:: ImPS_Elements_ListBox($pos_x, $pos_y)
.. attention::
    This class is not intended to be initialized directly.
.. note::
    This class inherits from :ref:`ImPS-Elements-Base`.

:Parameters:    
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.
:Attributes:    
                - **Drawable** (`[System.Windows.Forms.ListBox] <https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.listbox?view=windowsdesktop-7.0#properties>`_)
:Returns:       - [:ref:`ImPS-Elements-ListBox`]



.. function:: ListBoxItem()

.. note::
    This is the same as calling ``$this.Drawable.Items``

:Parameters:    None
:Returns:        - [`System.Windows.Forms.ListBox+ObjectCollection <https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.listbox.objectcollection?view=windowsdesktop-7.0#properties>`_]



.. function:: set_selected(index, $selected)

:Parameters:    
                - **$index** ([int]) - The index of the item to change.
                - **$selected** ([bool]) - true/false
:Returns:        - [:ref:`ImPS-Elements-ListBox`]



.. function:: get_selected($index)

:Parameters:    
                - **$index** ([int]) - The index of the item to get.
:Returns:        - [bool]