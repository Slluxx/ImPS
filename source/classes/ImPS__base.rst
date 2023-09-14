.. _ImPS-Elements-Base:
.. _ImPS-Panels-Base:


Baseclass for Elements and Panels
=================================

.. attention::
    The following class is only the baseclass for ImPS_Elements_$elem, not the Panel. I am debating about removing this class alltogther. See at the bottom for more information.


.. class:: ImPS_Elements__Base($parent)
.. attention::
    This class is not intended to be initialized directly.

:Parameters:
                - **$parent** ([object]) - The parent class
:Returns:       - [:ref:`ImPS-Elements-Base`]

.. function:: set_attr($attr, $value)

:Parameters:    - **$attr** ([string]) - Any attribute found in ``$this.Drawable``
                - **$value** ([object]) - The value to set
:Returns:       - [object] - ``$this``

.. function:: get_height()

:Parameters:    None
:Returns:       - [int]

.. function:: set_height($height)

:Parameters:    - **$height** ([int])
:Returns:       - [object] - ``$this``

.. function:: get_width()

:Parameters:    None
:Returns:       - [int]

.. function:: set_width($width)

:Parameters:    - **$width** ([int])
:Returns:       - [object] - ``$this``

.. function:: get_text()

:Parameters:    None
:Returns:       - [string]

.. function:: set_text($text)

:Parameters:    - **$text** ([string])
:Returns:       - [object] - ``$this``

.. function:: set_pos($x, $y)

:Parameters:    - **$x** ([int]) - The x position
                - **$y** ([int]) - The y position
:Returns:       - [object] - ``$this``

.. function:: set_font($font)

:Parameters:    - **$font** ([string]) - For example: "Verdana,8,style=Regular"
:Returns:       - [object] - ``$this``





------





The actual classes only implement getters and setters for attributes inside
``$this.Drawable``. Because of the way that i have to specify certain 
classes as return value of type ``[object]`` instead of their actual class type,
IntelliSense is lost. 

Usually getters and setters exist to restrict access to an attribute by
denying direct access and omitting a getter or setter. Since i dont control 
anything inside ``$this.Drawable`` and all the attributes are public anyway, 
having ImPS getters and setters for this is pretty much useless.

However, having getters and setters means, that at least with setters, i can return
an instance to whatever class is calling the setter. This means we can easily chain
multiple methods instead of calling them one after another.

.. code-block::

    myInstance.myMethod1().myMethod2().myMethod3()

    # instead of

    myInstance.myMethod1()
    myInstance.myMethod2()
    myInstance.myMethod3()

I am thinking about removing the getters and setters entirely to make anyone 
use ``$this.Drawable`` instead. This would remove **a lot** of code. Not just 
that but if there is a need for a helper method, i can just add it to the 
Element/Panel instance (instead of this helper class) and it will have 
IntelliSense. I am still not sure about this. Would it make this module 
obsolete? - Comments are welcome