package flowVerilog;
import FixedPoint:: *;
import SpecialFIFOs:: * ;
import Vector:: *;
import FIFO:: *;
import FIFOF:: *;
import datatypes::*;
import bitonic::*;
import compact::*;

#define L0 128
#define MEMWORD 2048
interface STDIN;
        method Action put(DataType datas);
        method Bit#(16) get;
endinterface

(*synthesize*)
module mkFlowTest(STDIN);
        CompactTree px              <- mkCompactTree;
        Reg#(Int#(16))  cache[L0];
        Reg#(UInt#(12)) sum_count <- mkReg(0);
        Reg#(Int#(16)) total_sum <- mkReg(0);
        Reg#(UInt#(12)) ent <- mkReg(0);
        Reg#(Bit#(MEMWORD)) inQ <- mkReg(0);

        for(int i=0; i < L0; i = i + 1)
                cache[i] <- mkReg(0);
        rule collect (ent == L0);
              px.put(unpack(inQ));
		ent <= 0;
       endrule

        rule receive (sum_count==0);
                let d <- px.get;
		Vector#(L0,Int#(16)) dx = unpack(d);
                for(int i=0; i < L0; i = i + 1)
                        cache[i] <= dx[i];
                sum_count <= 1;
        endrule
rule s1(sum_count == 1);
  total_sum <= total_sum + cache[0];
endrule
rule s2(sum_count == 2);
  total_sum <= total_sum + cache[1];
endrule
rule s3(sum_count == 3);
  total_sum <= total_sum + cache[2];
endrule
rule s4(sum_count == 4);
  total_sum <= total_sum + cache[3];
endrule
rule s5(sum_count == 5);
  total_sum <= total_sum + cache[4];
endrule
rule s6(sum_count == 6);
  total_sum <= total_sum + cache[5];
endrule
rule s7(sum_count == 7);
  total_sum <= total_sum + cache[6];
endrule
rule s8(sum_count == 8);
  total_sum <= total_sum + cache[7];
endrule
rule s9(sum_count == 9);
  total_sum <= total_sum + cache[8];
endrule
rule s10(sum_count == 10);
  total_sum <= total_sum + cache[9];
endrule
rule s11(sum_count == 11);
  total_sum <= total_sum + cache[10];
endrule
rule s12(sum_count == 12);
  total_sum <= total_sum + cache[11];
endrule
rule s13(sum_count == 13);
  total_sum <= total_sum + cache[12];
endrule
rule s14(sum_count == 14);
  total_sum <= total_sum + cache[13];
endrule
rule s15(sum_count == 15);
  total_sum <= total_sum + cache[14];
endrule
rule s16(sum_count == 16);
  total_sum <= total_sum + cache[15];
endrule
rule s17(sum_count == 17);
  total_sum <= total_sum + cache[16];
endrule
rule s18(sum_count == 18);
  total_sum <= total_sum + cache[17];
endrule
rule s19(sum_count == 19);
  total_sum <= total_sum + cache[18];
endrule
rule s20(sum_count == 20);
  total_sum <= total_sum + cache[19];
endrule
rule s21(sum_count == 21);
  total_sum <= total_sum + cache[20];
endrule
rule s22(sum_count == 22);
  total_sum <= total_sum + cache[21];
endrule
rule s23(sum_count == 23);
  total_sum <= total_sum + cache[22];
endrule
rule s24(sum_count == 24);
  total_sum <= total_sum + cache[23];
endrule
rule s25(sum_count == 25);
  total_sum <= total_sum + cache[24];
endrule
rule s26(sum_count == 26);
  total_sum <= total_sum + cache[25];
endrule
rule s27(sum_count == 27);
  total_sum <= total_sum + cache[26];
endrule
rule s28(sum_count == 28);
  total_sum <= total_sum + cache[27];
endrule
rule s29(sum_count == 29);
  total_sum <= total_sum + cache[28];
endrule
rule s30(sum_count == 30);
  total_sum <= total_sum + cache[29];
endrule
rule s31(sum_count == 31);
  total_sum <= total_sum + cache[30];
endrule
rule s32(sum_count == 32);
  total_sum <= total_sum + cache[31];
endrule
rule s33(sum_count == 33);
  total_sum <= total_sum + cache[32];
endrule
rule s34(sum_count == 34);
  total_sum <= total_sum + cache[33];
endrule
rule s35(sum_count == 35);
  total_sum <= total_sum + cache[34];
endrule
rule s36(sum_count == 36);
  total_sum <= total_sum + cache[35];
endrule
rule s37(sum_count == 37);
  total_sum <= total_sum + cache[36];
endrule
rule s38(sum_count == 38);
  total_sum <= total_sum + cache[37];
endrule
rule s39(sum_count == 39);
  total_sum <= total_sum + cache[38];
endrule
rule s40(sum_count == 40);
  total_sum <= total_sum + cache[39];
endrule
rule s41(sum_count == 41);
  total_sum <= total_sum + cache[40];
endrule
rule s42(sum_count == 42);
  total_sum <= total_sum + cache[41];
endrule
rule s43(sum_count == 43);
  total_sum <= total_sum + cache[42];
endrule
rule s44(sum_count == 44);
  total_sum <= total_sum + cache[43];
endrule
rule s45(sum_count == 45);
  total_sum <= total_sum + cache[44];
endrule
rule s46(sum_count == 46);
  total_sum <= total_sum + cache[45];
endrule
rule s47(sum_count == 47);
  total_sum <= total_sum + cache[46];
endrule
rule s48(sum_count == 48);
  total_sum <= total_sum + cache[47];
endrule
rule s49(sum_count == 49);
  total_sum <= total_sum + cache[48];
endrule
rule s50(sum_count == 50);
  total_sum <= total_sum + cache[49];
endrule
rule s51(sum_count == 51);
  total_sum <= total_sum + cache[50];
endrule
rule s52(sum_count == 52);
  total_sum <= total_sum + cache[51];
endrule
rule s53(sum_count == 53);
  total_sum <= total_sum + cache[52];
endrule
rule s54(sum_count == 54);
  total_sum <= total_sum + cache[53];
endrule
rule s55(sum_count == 55);
  total_sum <= total_sum + cache[54];
endrule
rule s56(sum_count == 56);
  total_sum <= total_sum + cache[55];
endrule
rule s57(sum_count == 57);
  total_sum <= total_sum + cache[56];
endrule
rule s58(sum_count == 58);
  total_sum <= total_sum + cache[57];
endrule
rule s59(sum_count == 59);
  total_sum <= total_sum + cache[58];
endrule
rule s60(sum_count == 60);
  total_sum <= total_sum + cache[59];
endrule
rule s61(sum_count == 61);
  total_sum <= total_sum + cache[60];
endrule
rule s62(sum_count == 62);
  total_sum <= total_sum + cache[61];
endrule
rule s63(sum_count == 63);
  total_sum <= total_sum + cache[62];
endrule
rule s64(sum_count == 64);
  total_sum <= total_sum + cache[63];
endrule
rule s65(sum_count == 65);
  total_sum <= total_sum + cache[64];
endrule
rule s66(sum_count == 66);
  total_sum <= total_sum + cache[65];
endrule
rule s67(sum_count == 67);
  total_sum <= total_sum + cache[66];
endrule
rule s68(sum_count == 68);
  total_sum <= total_sum + cache[67];
endrule
rule s69(sum_count == 69);
  total_sum <= total_sum + cache[68];
endrule
rule s70(sum_count == 70);
  total_sum <= total_sum + cache[69];
endrule
rule s71(sum_count == 71);
  total_sum <= total_sum + cache[70];
endrule
rule s72(sum_count == 72);
  total_sum <= total_sum + cache[71];
endrule
rule s73(sum_count == 73);
  total_sum <= total_sum + cache[72];
endrule
rule s74(sum_count == 74);
  total_sum <= total_sum + cache[73];
endrule
rule s75(sum_count == 75);
  total_sum <= total_sum + cache[74];
endrule
rule s76(sum_count == 76);
  total_sum <= total_sum + cache[75];
endrule
rule s77(sum_count == 77);
  total_sum <= total_sum + cache[76];
endrule
rule s78(sum_count == 78);
  total_sum <= total_sum + cache[77];
endrule
rule s79(sum_count == 79);
  total_sum <= total_sum + cache[78];
endrule
rule s80(sum_count == 80);
  total_sum <= total_sum + cache[79];
endrule
rule s81(sum_count == 81);
  total_sum <= total_sum + cache[80];
endrule
rule s82(sum_count == 82);
  total_sum <= total_sum + cache[81];
endrule
rule s83(sum_count == 83);
  total_sum <= total_sum + cache[82];
endrule
rule s84(sum_count == 84);
  total_sum <= total_sum + cache[83];
endrule
rule s85(sum_count == 85);
  total_sum <= total_sum + cache[84];
endrule
rule s86(sum_count == 86);
  total_sum <= total_sum + cache[85];
endrule
rule s87(sum_count == 87);
  total_sum <= total_sum + cache[86];
endrule
rule s88(sum_count == 88);
  total_sum <= total_sum + cache[87];
endrule
rule s89(sum_count == 89);
  total_sum <= total_sum + cache[88];
endrule
rule s90(sum_count == 90);
  total_sum <= total_sum + cache[89];
endrule
rule s91(sum_count == 91);
  total_sum <= total_sum + cache[90];
endrule
rule s92(sum_count == 92);
  total_sum <= total_sum + cache[91];
endrule
rule s93(sum_count == 93);
  total_sum <= total_sum + cache[92];
endrule
rule s94(sum_count == 94);
  total_sum <= total_sum + cache[93];
endrule
rule s95(sum_count == 95);
  total_sum <= total_sum + cache[94];
endrule
rule s96(sum_count == 96);
  total_sum <= total_sum + cache[95];
endrule
rule s97(sum_count == 97);
  total_sum <= total_sum + cache[96];
endrule
rule s98(sum_count == 98);
  total_sum <= total_sum + cache[97];
endrule
rule s99(sum_count == 99);
  total_sum <= total_sum + cache[98];
endrule
rule s100(sum_count == 100);
  total_sum <= total_sum + cache[99];
endrule
rule s101(sum_count == 101);
  total_sum <= total_sum + cache[100];
endrule
rule s102(sum_count == 102);
  total_sum <= total_sum + cache[101];
endrule
rule s103(sum_count == 103);
  total_sum <= total_sum + cache[102];
endrule
rule s104(sum_count == 104);
  total_sum <= total_sum + cache[103];
endrule
rule s105(sum_count == 105);
  total_sum <= total_sum + cache[104];
endrule
rule s106(sum_count == 106);
  total_sum <= total_sum + cache[105];
endrule
rule s107(sum_count == 107);
  total_sum <= total_sum + cache[106];
endrule
rule s108(sum_count == 108);
  total_sum <= total_sum + cache[107];
endrule
rule s109(sum_count == 109);
  total_sum <= total_sum + cache[108];
endrule
rule s110(sum_count == 110);
  total_sum <= total_sum + cache[109];
endrule
rule s111(sum_count == 111);
  total_sum <= total_sum + cache[110];
endrule
rule s112(sum_count == 112);
  total_sum <= total_sum + cache[111];
endrule
rule s113(sum_count == 113);
  total_sum <= total_sum + cache[112];
endrule
rule s114(sum_count == 114);
  total_sum <= total_sum + cache[113];
endrule
rule s115(sum_count == 115);
  total_sum <= total_sum + cache[114];
endrule
rule s116(sum_count == 116);
  total_sum <= total_sum + cache[115];
endrule
rule s117(sum_count == 117);
  total_sum <= total_sum + cache[116];
endrule
rule s118(sum_count == 118);
  total_sum <= total_sum + cache[117];
endrule
rule s119(sum_count == 119);
  total_sum <= total_sum + cache[118];
endrule
rule s120(sum_count == 120);
  total_sum <= total_sum + cache[119];
endrule
rule s121(sum_count == 121);
  total_sum <= total_sum + cache[120];
endrule
rule s122(sum_count == 122);
  total_sum <= total_sum + cache[121];
endrule
rule s123(sum_count == 123);
  total_sum <= total_sum + cache[122];
endrule
rule s124(sum_count == 124);
  total_sum <= total_sum + cache[123];
endrule
rule s125(sum_count == 125);
  total_sum <= total_sum + cache[124];
endrule
rule s126(sum_count == 126);
  total_sum <= total_sum + cache[125];
endrule
rule s127(sum_count == 127);
  total_sum <= total_sum + cache[126];
endrule
rule s128(sum_count == 128);
  total_sum <= total_sum + cache[127];
endrule
        method Action put(DataType datas) if(ent < L0);
                      Bit#(MEMWORD) x = zeroExtend(pack(datas));
                      inQ <= (inQ << 8) | x;
                      ent <= ent + 1;
                  endmethod

        method Bit#(16) get;
                return pack(total_sum);
        endmethod
endmodule
endpackage
