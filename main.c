
/***************************** Include Files *********************************/
#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include "xparameters.h"
#include "xspi.h"
#include "xspi_l.h"
#include "xil_printf.h"

/************************** Constant Definitions *****************************/

#define SPI_DEVICE_0_ID         XPAR_AXI_QUAD_SPI_0_DEVICE_ID
#define SPI_DEVICE_1_ID        	XPAR_AXI_QUAD_SPI_1_DEVICE_ID
#define SPI_DEVICE_2_ID        	XPAR_AXI_QUAD_SPI_2_DEVICE_ID
#define SPI_DEVICE_3_ID        	XPAR_AXI_QUAD_SPI_3_DEVICE_ID
#define SPI_DEVICE_4_ID         XPAR_AXI_QUAD_SPI_4_DEVICE_ID
#define SPI_DEVICE_5_ID         XPAR_AXI_QUAD_SPI_5_DEVICE_ID
#define SPI_DEVICE_6_ID         XPAR_AXI_QUAD_SPI_6_DEVICE_ID
#define SPI_DEVICE_7_ID         XPAR_AXI_QUAD_SPI_7_DEVICE_ID
#define SPI_DEVICE_8_ID       	XPAR_AXI_QUAD_SPI_8_DEVICE_ID
#define SPI_DEVICE_9_ID    		XPAR_AXI_QUAD_SPI_9_DEVICE_ID
#define SPI_DEVICE_10_ID		XPAR_AXI_QUAD_SPI_10_DEVICE_ID
#define SPI_DEVICE_11_ID        XPAR_AXI_QUAD_SPI_11_DEVICE_ID
#define SPI_DEVICE_12_ID        XPAR_AXI_QUAD_SPI_12_DEVICE_ID
#define SPI_DEVICE_13_ID        XPAR_AXI_QUAD_SPI_13_DEVICE_ID
#define SPI_DEVICE_14_ID        XPAR_AXI_QUAD_SPI_14_DEVICE_ID
#define SPI_DEVICE_15_ID        XPAR_AXI_QUAD_SPI_15_DEVICE_ID

#define BUFFER_SIZE         2

/************************** Function Definitions *****************************/

int spiInit(XSpi *SpiInstancePtr, u16 SpiDeviceId);
int spiCall(XSpi *SpiInstancePtr, int regData);
void callPath(int masterArr[], int channelArr[]);
void resetPath(void);
void init(void);
static void delay(int dly);

//_Bool valueInArray(int valArray[], int arrayLength, int value);
void clearArray(int arr[]);

static XSpi SpiInstance[16];
unsigned int SpiDevice[] = {
		SPI_DEVICE_0_ID, SPI_DEVICE_1_ID, SPI_DEVICE_2_ID, SPI_DEVICE_3_ID,
		SPI_DEVICE_4_ID, SPI_DEVICE_5_ID, SPI_DEVICE_6_ID, SPI_DEVICE_7_ID,
		SPI_DEVICE_8_ID, SPI_DEVICE_9_ID, SPI_DEVICE_10_ID, SPI_DEVICE_11_ID,
		SPI_DEVICE_12_ID, SPI_DEVICE_13_ID, SPI_DEVICE_14_ID, SPI_DEVICE_15_ID};

/**************************** Main Function *******************************/

int main(void)
{
    init();	// initialize SPI instances

    int arraySize = 4;
    int masterArray[4], channelArray[4];
    int masterIndex, channelIndex;
    int masterInput, channelInput;
    _Bool masterInputCheck = true;
    _Bool channelInputCheck = false;
    _Bool resetFlag = true;
    int num;

    while(1){

    	if (resetFlag){
    		xil_printf("Enter any key to reset paths: ");
    		scanf("%i", &num);
    		xil_printf("%i\r\n", num);
    		resetPath();
    		clearArray(masterArray);
    		clearArray(channelArray);
    		masterIndex = 0;
    		channelIndex = 0;
    		resetFlag = false;
    		xil_printf("Enter 4 electrode paths you would like to activate.\r\n\n");
    	}

    	if(masterIndex > channelIndex){
    		xil_printf("Enter channel(1-4): ");
    		scanf("%i", &channelInput);
    		xil_printf("%i\r\n", channelInput);
    		delay(5);
    	}
    	else{
    		xil_printf("Enter master(0-15): ");
    		scanf("%i", &masterInput);
    		xil_printf("%i\r\n", masterInput);
    		delay(5);
    	}


    	// Input checkpoint for both masterInput and channelInput
    	// check for master input
    	if (masterInputCheck) {
    		if (masterInput >= 0 && masterInput < 16) {
    			//masterFlag = valueInArray(masterArray, arraySize, masterInput);
    			//if (masterFlag == false) {
    				masterArray[masterIndex] = masterInput;
    				masterIndex++;
    				//masterInput = 0;
    				masterInputCheck = false;
    				channelInputCheck = true;
    			//} else
    				//xil_printf("This master has been entered, please enter a different master.\r\n");
    		} else
    			xil_printf("Please enter a valid input for a master.\r\n");
    	}

    	// check for channel input
    	else if (channelInputCheck){
    		if (channelInput > 0 && channelInput < 5) {
    			channelArray[channelIndex] = channelInput;
    			channelIndex++;
    			//channelInput = 0;
    			masterInputCheck = true;
    			channelInputCheck = false;
    			if (channelIndex == 4) {
    				xil_printf("\nYou have selected: \r\n\n");
    				xil_printf("Master: %i, channel: %i\r\n", masterArray[0], channelArray[0]);
    				xil_printf("Master: %i, channel: %i\r\n", masterArray[1], channelArray[1]);
    				xil_printf("Master: %i, channel: %i\r\n", masterArray[2], channelArray[2]);
    				xil_printf("Master: %i, channel: %i\r\n\n", masterArray[3], channelArray[3]);
    				xil_printf("Enter any key to send in paths: ");
    				scanf("%i", &num);
    				xil_printf("%i\r\n", num);
    				callPath(masterArray, channelArray);	// calls the paths for the electrodes
    				resetFlag = true;
    			}
    		} else
    			xil_printf("Please enter a valid input for a channel.\r\n");
    	}
    }

    return 0;
}


int spiInit(XSpi *SpiInstancePtr, u16 SpiDeviceId){

    int Status;
    XSpi_Config *ConfigPtr;

    ConfigPtr = XSpi_LookupConfig(SpiDeviceId);
    if (ConfigPtr == NULL)
        return XST_DEVICE_NOT_FOUND;

    Status = XSpi_CfgInitialize(SpiInstancePtr, ConfigPtr, ConfigPtr->BaseAddress);
    if (Status != XST_SUCCESS)
        return XST_FAILURE;

    Status = XSpi_SelfTest(SpiInstancePtr);
    if (Status != XST_SUCCESS)
        return XST_FAILURE;

    if (SpiInstancePtr-> SpiMode != XSP_STANDARD_MODE)
        return XST_SUCCESS;

    // XSP_LOOPBACK_OPTION - SPI is in loop-back and does not output anything
    // XSP_MANUAL_SSELECT_OPTION - SPI will output data via pins
    // set SPI options to master and manual slave-select
    Status = XSpi_SetOptions(SpiInstancePtr, XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);
    if (Status != XST_SUCCESS)
        return XST_FAILURE;

    return XST_SUCCESS;
}

int spiCall(XSpi *SpiInstancePtr, int regData){

    // the write buffer would be changed based on the regData input parameter
	u8 data = regData;
	u8 WriteBuffer[BUFFER_SIZE] = {1, data};
    u8 ReadBuffer[BUFFER_SIZE] = {0x00, 0x00};

    XSpi_Start(SpiInstancePtr);

    XSpi_IntrGlobalDisable(SpiInstancePtr);

    // be sure to select the slave before transferring any data (nothing will transmit if slave is not selected)
    XSpi_SetSlaveSelect(SpiInstancePtr, 0x01);

    XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);
    if (data != 0)
    	xil_printf("0x%02x, 0x%02x\r\n", ReadBuffer[0], ReadBuffer[1]);

    return XST_SUCCESS;
}

void callPath(int masterArr[], int channelArr[]){
	int data, Status;
	int* mArr = masterArr;
	int* cArr = channelArr;

	for(int i=0; i<4; i++){
		data = (cArr[i]*2)-1;
		Status = spiCall(&SpiInstance[mArr[i]], data);
		if (Status != XST_SUCCESS){
			return XST_FAILURE;
		}
	}
}

void resetPath(void){
	int Status;
	int reset_data = 0;

	for (int i=0; i<16; i++){
		Status = spiCall(&SpiInstance[i], reset_data);
		if (Status != XST_SUCCESS){
			return XST_FAILURE;
		}
	}
	xil_printf("Paths have been reset.\r\n");
}

void init(void){
	int Status;

	for (int i = 0; i < 16; i++){
		Status = spiInit(&SpiInstance[i], SpiDevice[i]);
		if (Status != XST_SUCCESS){
			return XST_FAILURE;
		}
	}

    xil_printf("Initialization complete\r\n");
}

static void delay(int dly){
    int i, j;
    for (i = 0; i < dly; i++)
        for (j = 0; j < 0xffff; j++);
}

/*
_Bool valueInArray(int valArray[], int arrayLength, int value){
    for (int i = 0; i<arrayLength; i++){
        if (valArray[i] == value) return true;
    }
    return false;
}
*/

void clearArray(int arr[]){
    for (int i = 0; i < 4; i++)
        arr[i] = 99;
}



