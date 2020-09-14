n = 3; % The number of drug combinations

% Initializing the Size-Difference matrix for a four fault network
E = zeros(34,34,34,256);

% "i", "j", "k" iterate over three faults, and d1, d2, d3, d4, d5, d6, d7, d8 iterate over drugs
for i = 0:33
    for j = i:33
        for k = j:33
            for d1 = 0:1
                for d2 = 0:1
                    for d3 = 0:1
                        for d4 = 0:1
                            for d5 = 0:1
                                for d6 = 0:1
                                    for d7 = 0:1
                                        for d8 = 0:1
                                            m = 128*d1 + 64*d2 + 32*d3 + 16*d4 + 8*d5 + 4*d6 + 2*d7 + d8 + 1;
                                            if (d1+d2+d3+d4+d5+d6+d7+d8 <= n) 
                                                E(i+1,j+1,k+1,m) = colorectal_three_faults(i,j,k,d1,d2,d3,d4,d5,d6,d7,d8);
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

E1 = sum(sum(sum(E))); % Summing the measures across different faults
E2 = E1(:,any(E1,2)); % Removing the zero columns
E3 = E2/max(abs(E2(:))); % Normalising the measure 
E4 = E3';

DC = {'Untreated';
    'U0126';
    'NT157';
    'NT157 + U0126';
    'AG1024';
    'AG1024 + U0126';
    'AG1024 + NT157';
    'AG1024 + NT157 + U0126';
    'H03867';
    'HO3867 + U0126';
    'HO3867 + NT157';
    'HO3867 + NT157 + U0126';
    'HO3867 + AG1024';
    'HO3867 + AG1024 + U0126';
    'HO3867 + AG1024 + NT157';
    'Lapatinib';
    'Lapatinib + U0126';
    'Lapatinib + NT157';
    'Lapatinib + NT157 + U0126';
    'Lapatinib + AG1024';
    'Lapatinib + AG1024 + U0126';
    'Lapatinib + AG1024 + NT157';
    'Lapatinib + HO3867';
    'Lapatinib + HO3867 + U0126';
    'Lapatinib + HO3867 + NT157';
    'Lapatinib + HO3867 + AG1024';
    'Temsirolimus';
    'Temsirolimus + U0126';
    'Temsirolimus + NT157';
    'Temsirolimus + NT157 + U0126';
    'Temsirolimus + AG1024';
    'Temsirolimus + AG1024 + U0126';
    'Temsirolimus + AG1024 + NT157';
    'Temsirolimus + HO3867';
    'Temsirolimus + HO3867 + U0126';
    'Temsirolimus + HO3867 + NT157';
    'Temsirolimus + HO3867 + AG1024';
    'Temsirolimus + Lapatinib';
    'Temsirolimus + Lapatinib + U0126';
    'Temsirolimus + Lapatinib + NT157';
    'Temsirolimus + Lapatinib + AG1024';
    'Temsirolimus + Lapatinib + HO3867';
    'LY294002';
    'LY294002 + U0126';
    'LY294002 + NT157';
    'LY294002 + NT157 + U0126';
    'LY294002 + AG1024';
    'LY294002 + AG1024 + U0126';
    'LY294002 + AG1024 + NT157';
    'LY294002 + HO3867';
    'LY294002 + HO3867 + U0126';
    'LY294002 + HO3867 + NT157';
    'LY294002 + HO3867 + AG1024';
    'LY294002 + Lapatinib';
    'LY294002 + Lapatinib + U0126';
    'LY294002 + Lapatinib + NT157';
    'LY294002 + Lapatinib + AG1024';
    'LY294002 + Lapatinib + HO3867';
    'LY294002 + Temsirolimus';
    'LY294002 + Temsirolimus + U0126';
    'LY294002 + Temsirolimus + NT157';
    'LY294002 + Temsirolimus + AG1024';
    'LY294002 + Temsirolimus + HO3867';
    'LY294002 + Temsirolimus + Lapatinib';
    'Cryptotanshinone';
    'Cryptotanshinone + U0126';
    'Cryptotanshinone + NT157';
    'Cryptotanshinone + NT157 + U0126';
    'Cryptotanshinone + AG1024';
    'Cryptotanshinone + AG1024 + U0126';
    'Cryptotanshinone + AG1024 + NT157';
    'Cryptotanshinone + HO3867';
    'Cryptotanshinone + HO3867 + U0126';
    'Cryptotanshinone + HO3867 + NT157';
    'Cryptotanshinone + HO3867 + AG1024';
    'Cryptotanshinone + Lapatinib';
    'Cryptotanshinone + Lapatinib + U0126';
    'Cryptotanshinone + Lapatinib + NT157';
    'Cryptotanshinone + Lapatinib + AG1024';
    'Cryptotanshinone + Lapatinib + HO3867';
    'Cryptotanshinone + Temsirolimus';
    'Cryptotanshinone + Temsirolimus + U0126';
    'Cryptotanshinone + Temsirolimus + NT157';
    'Cryptotanshinone + Temsirolimus + AG1024';
    'Cryptotanshinone + Temsirolimus + HO3867';
    'Cryptotanshinone + Temsirolimus + Lapatinib';
    'Cryptotanshinone + LY294002';
    'Cryptotanshinone + LY294002 + U0126';
    'Cryptotanshinone + LY294002 + NT157';
    'Cryptotanshinone + LY294002 + AG1024';
    'Cryptotanshinone + LY294002 + HO3867';
    'Cryptotanshinone + LY294002 + Lapatinib';
    'Cryptotanshinone + LY294002 + Temsirolimus'};


%display(E1);
final_output = [DC, num2cell(E4)];
display(final_output);
writecell(final_output,'final_output.xls');
