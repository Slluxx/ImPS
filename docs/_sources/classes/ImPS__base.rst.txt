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
having ImSP getters and setters for this is pretty much useless.

I am thinking about removing the getters and setters entirely to make anyone 
use ``$this.Drawable`` instead. This would remove **a lot** of code.
Not just that but if there is a need for a helper method, i can just add it
to the Element/Panel instance and it will have IntelliSense.
