
module bidirectional_buffer(in,out,en);
inout in,out;
input en;
//if(en)assign out = in;
//if(~en)assign in = out;
bufif1 g1(out,in,en);
bufif0 g2(in,out,en);
endmodule