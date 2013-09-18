% This program uses the voicebox toolbox at
% http://www.ee.ic.ac.uk/hp/staff/dmb/voicebox/voicebox.html

attr_num = 1612 + 390 + 1456;
inpFile = 'data.emd';
outFile = 'data.arff';

nrows = 2048;
ncols = 6;

% read input file
fid = fopen(inpFile);
n = 0;
    while ~feof(fid)
        n = n + 1;
        data(n).id = fscanf(fid, '%s', 1);
        data(n).value = fscanf(fid, '%d', [nrows, ncols]);        
    end
fclose(fid);

% write to arff file
fid = fopen(outFile, 'wt');

fprintf(fid, '@relation emvic_a\n\n');

for j = 1 : attr_num
    fprintf(fid, '@attribute a%d NUMERIC\n', j);
end

fprintf(fid, '@attribute class {a1,a2,a4,a5,a6,a7,a10,a11,a13,a15,a16,a17,a19,a21,a22,a25,a26,a27,a28,a29,a30,a32,a33,a34,a35,a36,a37,a38,a39,a40,a41,a42,a43,a44,a45,a47,a48}\n\n');
fprintf(fid, '@data\n');

for i = 1 : n    
    lx_mfcc = melcepst(data(i).value(:,3), 5000, 'e0');
    ly_mfcc = melcepst(data(i).value(:,4), 5000, 'e0');
    rx_mfcc = melcepst(data(i).value(:,5), 5000, 'e0');
    ry_mfcc = melcepst(data(i).value(:,6), 5000, 'e0');
    fprintf(fid, '%f,', lx_mfcc);
    fprintf(fid, '%f,', ly_mfcc);
    fprintf(fid, '%f,', rx_mfcc);
    fprintf(fid, '%f,', ry_mfcc);
       
    lrx = data(i).value(:,3) - data(i).value(:,5);
    lry = data(i).value(:,4) - data(i).value(:,6);
    lrx_mfcc = melcepst(lrx, 10000, 'e0');
    lry_mfcc = melcepst(lry, 10000, 'e0');
    fprintf(fid, '%f,', lrx_mfcc);
    fprintf(fid, '%f,', lry_mfcc);    
    
    lx_diff = diff(data(i).value(:,3));
    ly_diff = diff(data(i).value(:,4));
    rx_diff = diff(data(i).value(:,5));
    ry_diff = diff(data(i).value(:,6));
    lx_diff_mfcc = melcepst(lx_diff, 10000, 'e0d');
    ly_diff_mfcc = melcepst(ly_diff, 10000, 'e0d');
    rx_diff_mfcc = melcepst(rx_diff, 10000, 'e0d');
    ry_diff_mfcc = melcepst(ry_diff, 10000, 'e0d');        
    fprintf(fid, '%f,', lx_diff_mfcc);
    fprintf(fid, '%f,', ly_diff_mfcc);
    fprintf(fid, '%f,', rx_diff_mfcc);
    fprintf(fid, '%f,', ry_diff_mfcc);
    
    fprintf(fid, '%s\n', data(i).id);
end

fclose(fid);
