//Before we go straight to mixins let first look at the:
//Problems with extending and implementing

//****************
//Think back to the Animal examples again.
// Say you’ve got a bunch of birds, so you’re carefully planning an abstract class to represent them.
void main(){
  final tiger = Tiger();
  tiger.layEggs();
}

abstract class Bird{
  void fly();
  void layEggs();
}

class Robbin extends Bird{
  @override
  void fly() {
    print('Swoosh swoosh');
  }

  @override
  void layEggs() {
    print('Plop plop');
  }
}

//Your layEggs code for Robin is exactly the same as it is for Platypus in the previous file. 
//That means you’re duplicating code, which violates the DRY principle.

//The solution? Mixins!

//To make a mixin, you take whatever concrete code you want to share with different classes,
// and package it in its own special mixin class.

mixin EggLayer{
  void layEggs(){
    print('Plop plop');
  }
}

mixin Flyer{
  void fly(){
    print('Swoosh swoosh');
  }
}
//The mixin keyword indicates that these classes can only be used as mixins.

//Now refactor Robbin as follows, using the with keyword to identify the mixins:
class Tiger extends Bird with EggLayer, Flyer {}
