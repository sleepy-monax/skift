#include "cpu/cpuid.h"
#include "libc.h"

static inline int cpuid_string(int code, int where[4]) 
{
    __asm__ volatile ("cpuid":"=a"(*where),"=b"(*(where+0)),
                "=d"(*(where+1)),"=c"(*(where+2)):"a"(code));
    return (int)where[0];
}
 
string cpuid_get_vendorid() 
{
    static char s[16] = "BogusProces!";
    cpuid_string(0, (int*)(s));
    return s;
}

cpuid_t cpuid()
{
    cpuid_t cid;
    memset(&cid.vendorid, 0, 16);
    cpuid_string(0, (int*)&cid.vendorid[0]);
    cid.RAW_ECX = cpuid_get_feature_ECX();
    cid.RAW_EDX = cpuid_get_feature_EDX();
    
    return cid;
}

void cpuid_dump()
{
    cpuid_t cid = cpuid();
    
    printf("&fCPUID dump:&7\n\tVendorid: %s\n\tFeatures:", cid.vendorid);    

    // if (cid.PCLMUL ) { print(" PCLMUL"); }      
    // if (cid.DTES64 ) { print(" DTES64"); }       
    // if (cid.MONITOR) { print(" MONITOR"); }    
    // if (cid.DS_CPL ) { print(" DS_CPL"); }    
    // if (cid.VMX    ) { print(" VMX"); }    
    // if (cid.SMX    ) { print(" SMX"); }    
    // if (cid.EST    ) { print(" EST"); }    
    // if (cid.TM2    ) { print(" TM2"); }    
    // if (cid.SSSE3  ) { print(" SSSE3"); }    
    // if (cid.CID    ) { print(" CID"); }    
    // if (cid.FMA    ) { print(" FMA"); } 
    // if (cid.CX16   ) { print(" CX16"); }  
    // if (cid.ETPRD  ) { print(" ETPRD"); }  
    // if (cid.PDCM   ) { print(" PDCM"); }  
    // if (cid.PCIDE  ) { print(" PCIDE"); }  
    // if (cid.DCA    ) { print(" DCA"); }  
    // if (cid.SSE4_1 ) { print(" SSE4_1"); }  
    // if (cid.SSE4_2 ) { print(" SSE4_2"); }  
    // if (cid.x2APIC ) { print(" x2APIC"); }  
    // if (cid.MOVBE  ) { print(" MOVBE"); }  
    // if (cid.POPCNT ) { print(" POPCNT"); }  
    // if (cid.AES    ) { print(" AES"); }  
    // if (cid.XSAVE  ) { print(" XSAVE"); }  
    // if (cid.OSXSAVE) { print(" OSXSAVE"); }  
    // if (cid.AVX    ) { print(" AVX"); }  
    if (cid.FPU    ) { print(" FPU"); }   
    // if (cid.VME    ) { print(" VME"); }   
    // if (cid.DE     ) { print(" DE"); }   
    // if (cid.PSE    ) { print(" PSE"); }   
    // if (cid.TSC    ) { print(" TSC"); }   
    // if (cid.MSR    ) { print(" MSR"); }   
    if (cid.PAE    ) { print(" PAE"); }   
    // if (cid.MCE    ) { print(" MCE"); }   
    // if (cid.CX8    ) { print(" CX8"); }   
    // if (cid.APIC   ) { print(" APIC"); }   
    // if (cid.SEP    ) { print(" SEP"); }   
    // if (cid.MTRR   ) { print(" MTRR"); }   
    // if (cid.PGE    ) { print(" PGE"); }   
    // if (cid.MCA    ) { print(" MCA"); }   
    // if (cid.CMOV   ) { print(" CMOV"); }   
    // if (cid.PAT    ) { print(" PAT"); }   
    // if (cid.PSE36  ) { print(" PSE36"); }   
    // if (cid.PSN    ) { print(" PSN"); }   
    // if (cid.CLF    ) { print(" CLF"); }   
    // if (cid.DTES   ) { print(" DTES"); }   
    // if (cid.ACPI   ) { print(" ACPI"); }   
    // if (cid.MMX    ) { print(" MMX"); }   
    // if (cid.FXSR   ) { print(" FXSR"); }   
    if (cid.SSE    ) { print(" SSE"); }   
    if (cid.SSE2   ) { print(" SSE2"); }   
    if (cid.SSE3   ) { print(" SSE3"); } 
    // if (cid.SS     ) { print(" SS"); }   
    // if (cid.HTT    ) { print(" HTT"); }   
    // if (cid.TM1    ) { print(" TM1"); }   
    // if (cid.IA64   ) { print(" IA64"); }   
    // if (cid.PBE    ) { print(" PBE"); }
    print("&7\n");
}