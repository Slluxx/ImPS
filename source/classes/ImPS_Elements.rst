.. _ImPS-Elements:

ImPS_Elements
=============

.. class:: ImPS_Elements($parent)
.. attention::
    This class is not intended to be initialized directly.

:Parameters:
                - **$parent** ([object]) - The parent class
:Returns:        - [:ref:`ImPS-Elements`]



.. function:: add_Label($text, $pos_x, $pos_y)

:Parameters:    
                - **$text** ([string]) - The Label text.
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.

:Returns:        - [:ref:`ImPS-Elements-Label`]



.. function:: add_Checkbox($checked, $pos_x, $pos_y)

:Parameters:    
                - **$checked** ([bool]) - The state of the Checkbox (Ticked/Unticked).
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.

:Returns:        - [:ref:`ImPS-Elements-Checkbox`]



.. function:: add_Button($text, $pos_x, $pos_y)

:Parameters:    
                - **$text** ([string]) - The Button text.
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.

:Returns:        - [:ref:`ImPS-Elements-Button`]



.. function:: add_ListBox($pos_x, $pos_y)

:Parameters:    
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.

:Returns:        - [:ref:`ImPS-Elements-ListBox`]



.. function:: add_TextBox($text, $pos_x, $pos_y)

:Parameters:    
                - **$text** ([string]) - The text inside the TextBox.
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.

:Returns:        - [:ref:`ImPS-Elements-TextBox`]



.. function:: add_ProgressBar($value, $pos_x, $pos_y)

:Parameters:    
                - **$value** ([int]) - The value of the ProgressBar in percent (eg: 25 = 25%).
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.

:Returns:        - [:ref:`ImPS-Elements-ProgressBar`]



.. function:: add_ComboBox($pos_x, $pos_y)

:Parameters:    
                - **$pos_x** ([int]) - Its X position.
                - **$pos_y** ([int]) - Its Y position.

:Returns:        - [:ref:`ImPS-Elements-ComboBox`]