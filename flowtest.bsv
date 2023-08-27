package flowtest;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
import bitonic::*;
#define L0 256
(*synthesize*)
module mkFlowTest();

Bitonic px <- mkBitonic;

	rule push_data;
		Vector#(L0,Int#(32)) r = newVector;
		for (Int  # (16) i=0; i<L0; i = i + 1)
		r[0]=9374979;
		r[1]=8395781;
		r[2]=45424133;
		r[3]=20847361;
		r[4]=21241604;
		r[5]=48829698;
		r[6]=3870979;
		r[7]=45028357;
		r[8]=62067970;
		r[9]=42927109;
		r[10]=28508674;
		r[11]=26873859;
		r[12]=57870081;
		r[13]=63900417;
		r[14]=29824260;
		r[15]=10689027;
		r[16]=26479105;
		r[17]=16915715;
		r[18]=48568579;
		r[19]=27399426;
		r[20]=49022979;
		r[21]=2949636;
		r[22]=22221570;
		r[23]=4197124;
		r[24]=59838465;
		r[25]=16844545;
		r[26]=21106436;
		r[27]=14425859;
		r[28]=17696257;
		r[29]=53936385;
		r[30]=29499141;
		r[31]=48237826;
		r[32]=15729157;
		r[33]=62395140;
		r[34]=4787973;
		r[35]=19466241;
		r[36]=51514883;
		r[37]=41096451;
		r[38]=53877508;
		r[39]=22416386;
		r[40]=61020420;
		r[41]=39587075;
		r[42]=60100865;
		r[43]=32377859;
		r[44]=5900036;
		r[45]=17171204;
		r[46]=32772356;
		r[47]=47580673;
		r[48]=21302018;
		r[49]=27990018;
		r[50]=48892163;
		r[51]=18351363;
		r[52]=47256322;
		r[53]=23009281;
		r[54]=2099458;
		r[55]=51519489;
		r[56]=9572100;
		r[57]=21110275;
		r[58]=39722754;
		r[59]=22286337;
		r[60]=6619650;
		r[61]=10424837;
		r[62]=21106693;
		r[63]=57417474;
		r[64]=58592005;
		r[65]=22152193;
		r[66]=60494595;
		r[67]=49218051;
		r[68]=8851713;
		r[69]=36376578;
		r[70]=14028548;
		r[71]=27332613;
		r[72]=64035075;
		r[73]=17632261;
		r[74]=47976705;
		r[75]=18023682;
		r[76]=17565189;
		r[77]=46662917;
		r[78]=7674116;
		r[79]=5970179;
		r[80]=49809925;
		r[81]=55844610;
		r[82]=57152005;
		r[83]=61217029;
		r[84]=8855041;
		r[85]=3416066;
		r[86]=64882434;
		r[87]=51446529;
		r[88]=8720641;
		r[89]=39130113;
		r[90]=11995908;
		r[91]=52167684;
		r[92]=6168324;
		r[93]=26936581;
		r[94]=19268353;
		r[95]=61212417;
		r[96]=13440004;
		r[97]=3149316;
		r[98]=37230082;
		r[99]=2563074;
		r[100]=31458306;
		r[101]=49681412;
		r[102]=4070405;
		r[103]=56626947;
		r[104]=41162753;
		r[105]=32506629;
		r[106]=35459841;
		r[107]=47647492;
		r[108]=13503492;
		r[109]=15736321;
		r[110]=2950657;
		r[111]=52233731;
		r[112]=63641603;
		r[113]=50274052;
		r[114]=63183874;
		r[115]=43452932;
		r[116]=45811971;
		r[117]=43782913;
		r[118]=8789761;
		r[119]=60430849;
		r[120]=3218177;
		r[121]=31332865;
		r[122]=12910852;
		r[123]=17826309;
		r[124]=25172225;
		r[125]=33358851;
		r[126]=5510402;
		r[127]=10296325;
		r[128]=60688642;
		r[129]=30870019;
		r[130]=42339076;
		r[131]=7738885;
		r[132]=63901185;
		r[133]=47514629;
		r[134]=1449985;
		r[135]=55641602;
		r[136]=41687298;
		r[137]=18024709;
		r[138]=42209285;
		r[139]=36310532;
		r[140]=38472965;
		r[141]=9051652;
		r[142]=24314625;
		r[143]=48304387;
		r[144]=17173249;
		r[145]=15008257;
		r[146]=16719109;
		r[147]=48631299;
		r[148]=5573122;
		r[149]=56825602;
		r[150]=53084417;
		r[151]=7542789;
		r[152]=52102405;
		r[153]=49023491;
		r[154]=41160707;
		r[155]=19794433;
		r[156]=45486852;
		r[157]=36439811;
		r[158]=64291330;
		r[159]=54728962;
		r[160]=17308164;
		r[161]=60495362;
		r[162]=18487810;
		r[163]=27330051;
		r[164]=21564421;
		r[165]=12652802;
		r[166]=19795201;
		r[167]=25630724;
		r[168]=9898501;
		r[169]=20121861;
		r[170]=11077891;
		r[171]=41294853;
		r[172]=57479941;
		r[173]=46930947;
		r[174]=58597121;
		r[175]=55904001;
		r[176]=54599170;
		r[177]=49811461;
		r[178]=29296900;
		r[179]=5117697;
		r[180]=62915331;
		r[181]=50924034;
		r[182]=40704260;
		r[183]=19794181;
		r[184]=40173828;
		r[185]=31134980;
		r[186]=61082370;
		r[187]=62852355;
		r[188]=49876996;
		r[189]=35390981;
		r[190]=8718594;
		r[191]=38932739;
		r[192]=13962244;
		r[193]=65143555;
		r[194]=54724868;
		r[195]=58592257;
		r[196]=19927553;
		r[197]=60562945;
		r[198]=52169989;
		r[199]=10750721;
		r[200]=18482435;
		r[201]=54468357;
		r[202]=55778053;
		r[203]=49746691;
		r[204]=1970180;
		r[205]=44112132;
		r[206]=13635073;
		r[207]=21892353;
		r[208]=52238850;
		r[209]=54926084;
		r[210]=27201025;
		r[211]=29692419;
		r[212]=2100995;
		r[213]=38604036;
		r[214]=21629957;
		r[215]=15211268;
		r[216]=19271681;
		r[217]=62921217;
		r[218]=34931714;
		r[219]=32441346;
		r[220]=34348037;
		r[221]=56561666;
		r[222]=40699139;
		r[223]=33884418;
		r[224]=54920962;
		r[225]=11144709;
		r[226]=38931972;
		r[227]=33757187;
		r[228]=57674244;
		r[229]=58069505;
		r[230]=9837572;
		r[231]=31326977;
		r[232]=6756609;
		r[233]=39782661;
		r[234]=5379074;
		r[235]=60097284;
		r[236]=9177601;
		r[237]=42670084;
		r[238]=17237762;
		r[239]=13242882;
		r[240]=38737156;
		r[241]=27001860;
		r[242]=27790597;
		r[243]=59311106;
		r[244]=43260418;
		r[245]=59441668;
		r[246]=3476996;
		r[247]=10751233;
		r[248]=2169604;
		r[249]=7805186;
		r[250]=15663876;
		r[251]=55843589;
		r[252]=8914693;
		r[253]=39848961;
		r[254]=27400196;
		r[255]=10559490;
		px.put(r);
	endrule


	rule get_data;
	let d <- px.get;
		for(int i=0; i<L0; i=i+1) begin
			 Int#(8) dx = unpack(truncate(pack(d[i])));
			 Int#(8) dx1 = unpack(truncate(pack(d[i])>>8));
			$display("%d %d",dx, dx1);
		end
			$finish(0);
	endrule

endmodule
endpackage