.. _ImPS-Elements-Base:
.. _ImPS-Panels-Base:


Baseclass for Elements and Panels
=================================

This is just a placeholder file. 

The actual classes only implement getters and setters for attributes inside
``$this.Drawable``. Because of the way that i have to specify certain 
classes as return value of type ``[object]`` instead of their actual class type,
IntelliSense is lost. 

Usually getters and setters exist to restrict access to an attribute by
denying direct access and omitting a getter or setter. Since i dont control 
anything inside ``$this.Drawable`` and all the attributes are public anyway, 
having ImPS getters and setters for this is pretty much useless.

However, having getters and setters mean, that at least with setters, i can return
an instance to whatever class is calling the setter. This means we can easily chain
multiple methods instead of calling them one after another.

.. code-block::
    
    myInstance.myMethod1().myMethod2().myMethod3()

    # instead of

    myInstance.myMethod1()
    myInstance.myMethod2()
    myInstance.myMethod3()

I am thinking about removing the getters and setters entirely to make anyone 
use ``$this.Drawable`` instead. This would remove **a lot** of code.
Not just that but if there is a need for a helper method, i can just add it
to the Element/Panel instance and it will have IntelliSense. I am still not
sure about this - comments are welcome.
