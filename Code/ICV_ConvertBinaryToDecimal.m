function decimal = ICV_ConvertBinaryToDecimal(bitcode)
sum = 0;
power = 7;
for i = 1:8
    sum = sum + bitcode(1,i)*(2^power);
    power = power - 1;
end
decimal = sum;
end