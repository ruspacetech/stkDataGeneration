function [] = makeTextFile(name, data)

% Make text file with name
name = convertStringsToChars(name);
fileName = ['tmp/', name, '.txt'];
fid = fopen(fileName, 'wt');
fclose(fid);

% Write data into text file
writematrix(data, fileName, 'Delimiter', 'space', 'QuoteStrings', false, 'WriteMode', 'append')

end