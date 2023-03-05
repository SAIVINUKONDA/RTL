

module bidirectional_buffer_tb;
reg en;
wire in,out;
reg a,b;
integer i;
bidirectional_buffer dut(.in(in),.out(out),.en(en));
assign in = en ? a : 1'bz;
assign out = ~en ? b : 1'bz;
initial
begin
for (i=0;i<8;i=i+1)
begin
{a,b,en}=i;
#10;
end
end
initial $monitor($time," in=%b,out=%b,en=%b,a=%b,b=%b",in,out,en,a,b);
initial #80 $stop;
endmodule

/*

#                    0 in=0,out=0,en=0,a=0,b=0
#                   10 in=0,out=0,en=1,a=0,b=0
#                   20 in=1,out=1,en=0,a=0,b=1
#                   30 in=0,out=0,en=1,a=0,b=1
#                   40 in=0,out=0,en=0,a=1,b=0
#                   50 in=1,out=1,en=1,a=1,b=0
#                   60 in=1,out=1,en=0,a=1,b=1
#                   70 in=1,out=1,en=1,a=1,b=1
*/

