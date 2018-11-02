function output = runsewe_registers() 

fileID_in = fopen('runsewe_1bitregisterin.txt', 'w'); 
fileID_out = fopen('runsewe_1bitregisterout.txt', 'w');

fileID2_in = fopen('runsewe_16bitregisterin.txt', 'w');
fileID2_out = fopen('runsewe_16bitregisterout.txt', 'w'); 

fileID3_in = fopen('runsewe_16bitpcin.txt', 'w'); 
fileID3_out = fopen('runsewe_16bitpcout.txt', 'w'); 

fileID4_in = fopen('runsewe_nzplogicin.txt', 'w');
fileID4_out = fopen('runsewe_nzplogicout.txt', 'w'); 

% This block of code is used to create input and output test vectors for a
% 1-bit register using synchronous reset controlls 
for i = 1:-1:0 
    reset = dec2bin(i, 1); 
    
    for j = 0:1 
        enable = dec2bin(j, 1);
        
        for k = 0: 1
            op_a1 = dec2bin(k, 1); 
            fprintf(fileID_in, '%s\r\n', [reset ' ' enable ' ' op_a1]);
            
            if reset == '1' 
                s_d = '0';
                ps_d = s_d;       
            elseif enable == '1'
                s_d = op_a1;
                ps_d = s_d;  
            else 
                s_d = ps_d;             
            end   
            fprintf(fileID_out, '%s\r\n', s_d);   
        end 
    end 
end 
 

%This block of code generates input and output test vectors for a 16-bit
%register with synchronous reset controls 
ps_d2 = {dec2bin(0,16), dec2bin(0,16), dec2bin(0,16), dec2bin(0,16), dec2bin(0,16)};

 for x = 0:3 
    reset2 = '1'; 
    enable2 = '0';   
    op_a2 = dec2bin(x, 16); 
    fprintf(fileID2_in, '%s\r\n', [reset2 ' ' enable2 ' ' op_a2]);
    fprintf(fileID2_out, '%s\r\n', dec2bin(0, 16));
end 

for y = 4:7 
    reset2 = '0'; 
    enable2 = dec2bin(mod(y, 2), 1);
    op_a2 = dec2bin(y, 16);
    fprintf(fileID2_in, '%s\r\n', [reset2 ' ' enable2 ' ' op_a2]);
    
    if enable2 == '1'
        s_d2 = op_a2;
        ps_d2(y-2) = cellstr(s_d2);
    else 
        s_d2 = char(ps_d2(y-3));
    end 
    fprintf(fileID2_out, '%s\r\n', s_d2);
end 

for z = 8:(2^16 - 1) 
    reset2 = '0';
    enable2 = '1'; 
    op_a2 = dec2bin(z,16); 
    
    fprintf(fileID2_in, '%s\r\n', [reset2, ' ' enable2 ' ' op_a2]);
     fprintf(fileID2_out, '%s\r\n', op_a2);
end 
        
% This block of code generates input and output test vectors for a 16-bit
% program counter using synchronous reset controls. The input file generated 
% contains one 16-bit input and the output file contains two 16-bit outputs 
ps_d3 = {dec2bin(0,16), dec2bin(0,16), dec2bin(0,16), dec2bin(0,16), dec2bin(0,16)};
p_op_r = {dec2bin(0,16), dec2bin(0,16), dec2bin(0,16), dec2bin(0,16), dec2bin(0,16)};

for a = 0:3 
    reset3 = '1'; 
    enable3 = '0'; 
    
    op_a3 = dec2bin(a, 16); 
    fprintf(fileID3_in, '%s\r\n', [reset3 ' ' enable3 ' ' op_a3]);
    fprintf(fileID3_out, '%s\r\n', [dec2bin(0, 16) ' ' dec2bin(1,16)]); 
end 
for b = 4:7 
    reset3 = '0'; 
    enable3 = dec2bin(mod(b, 2), 1);
    op_a3 = dec2bin(b, 16);
    op_r = dec2bin(b+1, 16);
    fprintf(fileID3_in, '%s\r\n', [reset3 ' ' enable3 ' ' op_a3]);

    if enable3 == '1'
        s_d3 = op_a3;
        ps_d3(b-2) = cellstr(s_d3); 
        p_op_r(b-2) = cellstr(op_r);
    else 
        s_d3 = char(ps_d3(b-3)); 
        op_r = char(p_op_r(b-3));
    end 
fprintf(fileID3_out, '%s\r\n', [s_d3, ' ', op_r]);
end

for c = 8:(2^16 - 2)
    reset3 = '0';
    enable3 = '1'; 
    op_a3 = dec2bin(c, 16);
    op_r = dec2bin(c+1, 16);

    fprintf(fileID3_in, '%s\r\n', [reset3 ' ' enable3 ' ' op_a3]);
    fprintf(fileID3_out, '%s\r\n', [op_a3 ' ' op_r]);

end           
              
%this block of code produces input and output test vectors for a 16-bit to
% 3-bit NZP logic register.  

p_op_q = {dec2bin(1,3), dec2bin(0,3), dec2bin(0,3), dec2bin(0,3), dec2bin(0,3)};

for t = 0:3 
    reset4 = '1';
    enable4 = '0';   
    op_a4 = dec2bin(t, 16); 
    
    fprintf(fileID4_in, '%s\r\n', [reset4 ' ' enable4 ' ' op_a4]);
    fprintf(fileID4_out, '%s\r\n', dec2bin(0, 3));
    
end 

for u = 4:7
    reset4 = '0';
    enable4 = dec2bin(mod(u,2), 1); 
    op_a4 = dec2bin(u, 16);
    
    fprintf(fileID4_in, '%s\r\n', [reset4 ' ' enable4 ' ' op_a4]);
    
    if enable4 == 1 && op_a4(1) == '1'  
        op_q = '100';
        p_op_q((u-2)) = cellstr(op_q);
    elseif enable4 == '1' && bin2dec(op_a4) == '0' 
        op_q = '010';
        p_op_q((u-2)) = cellstr(op_q);
    elseif enable4 == '1' && op_a4(1) == '0'
        op_q = '001';
        p_op_q((u-2)) = cellstr(op_q);
    else 
        op_q = char(p_op_q(u-3)); 
    end 
    
    fprintf(fileID4_out, '%s\r\n', op_q);
end 
    
 for v = 8 :(2^16)-1
     reset4 = '0';
     enable4 = '1'; 
     op_a4 = dec2bin(v, 16);
    
    fprintf(fileID4_in, '%s\r\n', [reset4 ' ' enable4 ' ' op_a4]);
    
    if op_a4(1) == '1' 
        op_q = '100';
     elseif op_a4 == dec2bin(0, 16) 
        op_q = '010'; 
     else 
        op_q = '001';
     end
     fprintf(fileID4_out, '%s\r\n', op_q);
end 
  
