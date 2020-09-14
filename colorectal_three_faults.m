% Three faults simultaneously

function output = colorectal_three_faults(fault1, fault2, fault3, x1, x2, x3, x4, x5, x6, x7, x8)

    % Inputs
    EGF = 0; HBEGF = 0; IGF = 0; NRG1 = 0; TGFB = 0; WNT = 0; PTEN = 1;

    % Drugs
    CRY = x1; LY294002 = x2; Temsirolimus = x3; Lapatinib = x4; HO3867 = x5; AG1024 = x6; NT157 = x7; U0126 = x8;
    
    if (fault1 == 1 || fault2 == 1 || fault3 == 1)
        EGFR = 1; 
    else
        EGFR = EGF; 
    end
    
    if (fault1 == 2 || fault2 == 2 || fault3 == 2)
        ERBB3 = 1;
    else
        ERBB3 = EGF | HBEGF;
    end
    
    if (fault1 == 3 || fault2 == 3 || fault3 == 3)
        IFGR1AB = 1;
    else
        IFGR1AB = IGF;
    end
    
    if (fault1 == 4 || fault2 == 4 || fault3 == 4)
        ERBB2 = 1;
    else
        ERBB2 = NRG1;
    end
    
    if (fault1 == 5 || fault2 == 5 || fault3 == 5)
        JAK1 = 1;
    else
        JAK1 = (EGFR & ~Lapatinib);
    end
    
    if (fault1 == 6 || fault2 == 6 || fault3 == 6)
        STAT3 = 1;
    else
        STAT3 = JAK1;
    end
    
    if (fault1 == 7 || fault2 == 7 || fault3 == 7)
        IRS1 = 1;
    else
        IRS1 = (IFGR1AB & ~AG1024);
    end
    
    if (fault1 == 8 || fault2 == 8 || fault3 == 8)
        GRB2 = 1;
    else
        GRB2 = ((EGFR & ~Lapatinib)| (ERBB3 & ~Lapatinib) | (IFGR1AB & ~AG1024) | (ERBB2 & ~Lapatinib));
    end
        
    if (fault1 == 9 || fault2 == 9 || fault3 == 9)
        RAS = 1;
    else
        RAS = GRB2;
    end
    
    if (fault1 == 10 || fault2 == 10 || fault3 == 10)
        MEKK1 = 1;
    else
        MEKK1 = RAS;
    end
    
    if (fault1 == 11 || fault2 == 11 || fault3 == 11)
        RAF = 1;
    else
        RAF = RAS;
    end
    
    if (fault1 == 12 || fault2 == 12 || fault3 == 12)
        MKK4 = 1;
    else
        MKK4 = MEKK1;
    end
    
    if (fault1 == 13 || fault2 == 13 || fault3 == 13)
        MEK1 = 1;
    else
        MEK1 = RAF;
    end    

    if (fault1 == 14 || fault2 == 14 || fault3 == 14)
        PIK3CA = 1;
    else
        PIK3CA = (RAS | (STAT3 & (~CRY & ~HO3867)) | (IRS1 & ~NT157) | (ERBB2 & ~Lapatinib));
    end 
    
    if (fault1 == 15 || fault2 == 15 || fault3 == 15)
        DVL = 1;
    else
        DVL = WNT;
    end 

    if (fault1 == 16 || fault2 == 16 || fault3 == 16)
        ERK1 = 1;
    else
        ERK1 = (MEK1 & ~U0126);
    end 
    
    if (fault1 == 17 || fault2 == 17 || fault3 == 17)
        PIP3 = 1; 
    else
        PIP3 = ((PIK3CA & ~LY294002) | (~PTEN)); 
    end 
    
    if (fault1 == 18 || fault2 == 18 || fault3 == 18)
        PDPK1 = 1;
    else
        PDPK1 = PIP3;
    end
    
    if (fault1 == 19 || fault2 == 19 || fault3 == 19)
        AKT = 1;
    else
        AKT = PIP3;
    end

    if (fault1 == 20 || fault2 == 20 || fault3 == 20)
        TSC1 = 0;
    else
        TSC1 = ~(AKT); 
    end

    if (fault1 == 21 || fault2 == 21 || fault3 == 21)
        RHEB = 1;
    else
        RHEB = ~TSC1;
    end

    if (fault1 == 22 || fault2 == 22 || fault3 == 22)
        mTOR = 1;
    else
        mTOR = RHEB;
    end

    if (fault1 == 23 || fault2 == 23 || fault3 == 23)
       RPS6KB1 = 1; 
    else
       RPS6KB1 = ((ERK1 & ~CRY) | PDPK1 | (mTOR & ~(Temsirolimus))); 
    end

    if (fault1 == 24 || fault2 == 24 || fault3 == 24)
       BAD = 0; 
    else
       BAD = ~(RPS6KB1 | (AKT)); 
    end

    if (fault1 == 25 || fault2 == 25 || fault3 == 25)
       RAC1 = 1; 
    else
       RAC1 = DVL; 
    end

    if (fault1 == 26 || fault2 == 26 || fault3 == 26)
       TRAF = 1; 
    else
       TRAF = TGFB; 
    end

    if (fault1 == 27 || fault2 == 27 || fault3 == 27)
       TAK1 = 1; 
    else
       TAK1 = TRAF; 
    end

    if (fault1 == 28 || fault2 == 28 || fault3 == 28)
       SMAD = 1; 
    else
       SMAD = TAK1 | (ERK1 & ~CRY); 
    end

    if (fault1 == 29 || fault2 == 29 || fault3 == 29)
       JNK1 = 1; 
    else
       JNK1 = RAC1 | MKK4; 
    end

    if (fault1 == 30 || fault2 == 30 || fault3 == 30)
        GSK3 = 0;
    else
        GSK3 = ~(AKT | DVL); 
    end

    if (fault1 == 31 || fault2 == 31 || fault3 == 31)
        APC = 1;
    else
        APC = (GSK3); 
    end
    
    if (fault1 == 32 || fault2 == 32 || fault3 == 32)
        CTNNB1 = 1;
    else
        CTNNB1 = ~(GSK3); 
    end
    
    if (fault1 == 33 || fault2 == 33 || fault3 == 33)
        TCF = 1;
    else
        TCF = CTNNB1; 
    end

    
    CCND1 = ~APC; 
    BCL2 = ((STAT3 & (~CRY & ~HO3867)) & ~BAD);
    SRFELK1 = (ERK1 & ~CRY) & RPS6KB1; 
    FOSJUN = JNK1 & RPS6KB1;
    SRFELK4 = (ERK1 & ~CRY) & RPS6KB1; 
    SP1 = (SMAD & JNK1);
    cMYC = (TCF | (ERK1 & ~CRY));
    
    output1 = [CCND1, BCL2, SRFELK1, FOSJUN, SRFELK4, SP1, cMYC]; 
    output2 = [0,0,0,0,0,0,0]; % Ideal Output
    
    
    % Check the difference in outputs
    a=0; b=0; c=0; d=0;
    for i = 1:7
        if output1(i) == 1 && output2(i) == 1
            a=a+1;
        elseif output1(i) == 0 && output2(i) == 1
            b=b+1;
        elseif output1(i) == 1 && output2(i) == 0
            c=c+1; 
        elseif output1(i) == 0 && output2(i) == 0
            d=d+1; 
        end
    end

    output = ((b+c)^2)/((a+b+c+d)^2); %Size difference
end
