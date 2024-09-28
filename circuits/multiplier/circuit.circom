pragma circom 2.0.0;

//This circuit template checks that c is the multiplication of a and b./  

template Multiplier2 () {  
   signal input a1;
   signal input b1;
   signal x2;
   signal y2;
   signal output q3;

   component and_gate=AND();
   component or_gate=OR();
   component not_gate=NOT();

   and_gate.a <== a1;
   and_gate.b <== b1;
   x2 <== and_gate.out ;

   not_gate.in <== b1 ;
   y2 <== not_gate.out;

   or_gate.a <== x2;
   or_gate.b <== y2;
   q3 <== or_gate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();