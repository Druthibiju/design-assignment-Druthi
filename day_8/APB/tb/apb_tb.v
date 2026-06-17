interface apb_if(input bit PCLK);
logic PRESETn;
logic PSEL;
logic PENABLE;
logic PWRITE;
logic [7:0] PADDR;
logic [31:0] PWDATA;
logic [31:0] PRDATA;
logic PREADY;
logic PSLVERR;
endinterface

class apb_transaction;
rand bit [7:0] addr;
rand bit [31:0] wdata;
rand bit write;
bit [31:0] rdata;

function void display(string tag="TRANS");
$display("[%s] addr=%0h write=%0b wdata=%0h rdata=%0h",
tag,addr,write,wdata,rdata);
endfunction
endclass

class generator;
mailbox #(apb_transaction) gen2drv;
int count;

function new(mailbox #(apb_transaction) gen2drv);
this.gen2drv = gen2drv;
endfunction

task run();
apb_transaction wr;
apb_transaction rd;

repeat(count) begin
wr = new();
wr.addr = $urandom_range(0,255);
wr.wdata = $urandom;
wr.write = 1;
gen2drv.put(wr);
wr.display("GEN_WRITE");

rd = new();
rd.addr = wr.addr;
rd.write = 0;
gen2drv.put(rd);
rd.display("GEN_READ");
end
endtask
endclass

class driver;
virtual apb_if vif;
mailbox #(apb_transaction) gen2drv;

function new(mailbox #(apb_transaction) gen2drv,
virtual apb_if vif);
this.gen2drv = gen2drv;
this.vif = vif;
endfunction

task reset();
vif.PSEL <= 0;
vif.PENABLE <= 0;
vif.PWRITE <= 0;
vif.PADDR <= 0;
vif.PWDATA <= 0;
wait(vif.PRESETn);
endtask

task run();
apb_transaction tr;

forever begin
gen2drv.get(tr);

@(posedge vif.PCLK);
vif.PSEL <= 1;
vif.PENABLE <= 0;
vif.PWRITE <= tr.write;
vif.PADDR <= tr.addr;
vif.PWDATA <= tr.wdata;

@(posedge vif.PCLK);
vif.PENABLE <= 1;

wait(vif.PREADY);

@(posedge vif.PCLK);
vif.PSEL <= 0;
vif.PENABLE <= 0;
end
endtask
endclass
