.. _ImPS-Elements-ComboBox:

ImPS_Elements_ComboBox
======================

.. class:: ImPS_Elements_ComboBox($pos_x, $pos_y)
.. attention::
    This class is not intended to be initialized directly.
.. note::
    This class inherits from :ref:`ImPS-Elements-Base`.

:Parameters:    
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.
:Attributes:    
                - **Drawable** (`[System.Windows.Forms.ComboBox] <https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.combobox?view=windowsdesktop-7.0#properties>`_)
:Returns:       - [:ref:`ImPS-Elements-ComboBox`]



.. function:: ComboBoxItem()

.. note::
    This is the same as calling ``$this.Drawable.Items``

:Parameters:    None
:Returns:        - [`System.Windows.Forms.ComboBox+ObjectCollection <https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.combobox.objectcollection?view=windowsdesktop-7.0#properties>`_]



.. function:: set_selection($index)

:Parameters:    
                - **$index** ([int]) - Set selected by index.
:Returns:       - [:ref:`ImPS-Elements-ProgressBar`]



.. :no-index:function:: set_selection($value)

:Parameters:    
                - **$value** ([string]) - Set selected by value.
:Returns:       - [:ref:`ImPS-Elements-ProgressBar`]



.. function:: get_selectionIndex()

:Parameters:    None
:Returns:       - [int]



.. function:: get_selectionValue()

:Parameters:    None
:Returns:       - [string]


