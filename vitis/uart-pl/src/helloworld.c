/******************************************************************************
* Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_types.h"
#include "xil_assert.h"
#include "xuartps_hw.h"
#include "xgpio.h"

#define UART_BASEADDR		XPAR_XUARTPS_0_BASEADDR
#define UART_CLOCK_HZ		XPAR_XUARTPS_0_CLOCK_HZ
#define TEST_BUFFER_SIZE	16
#define CHAR_ESC			0x1b	/* 'ESC' character is used as terminator */

u8 SendBuffer[TEST_BUFFER_SIZE];	/* Buffer for Transmitting Data */

int main(){
	init_platform();

	int Index;
	u8 RecvChar;
	u32 CntrlRegister, Running;
	XGpio num, received, finish;

    print("SSSSSSSSSSSSSSSSSSSSSSSS\n\r");

    //Init UART
    CntrlRegister = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_CR_OFFSET);

	/* Enable TX and RX for the device */
	XUartPs_WriteReg(UART_BASEADDR, XUARTPS_CR_OFFSET,
			  ((CntrlRegister & ~XUARTPS_CR_EN_DIS_MASK) |
			   XUARTPS_CR_TX_EN | XUARTPS_CR_RX_EN));
	/*
	 * Initialize the send buffer bytes with a pattern to send and the
	 * the receive buffer bytes to zero
	 */
	for (Index = 0; Index < TEST_BUFFER_SIZE; Index++) {
		SendBuffer[Index] = Index + '0';
	}

	/* Send the entire transmit buffer. */
	for (Index = 0; Index < TEST_BUFFER_SIZE; Index++) {
		/* Wait until there is space in TX FIFO */
		 while (XUartPs_IsTransmitFull(UART_BASEADDR));

		/* Write the byte into the TX FIFO */
		XUartPs_WriteReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET,
				  SendBuffer[Index]);
	}

	//Init GPIO
	XGpio_Initialize(&finish, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_Initialize(&received, XPAR_AXI_GPIO_1_DEVICE_ID);
	XGpio_Initialize(&num, XPAR_AXI_GPIO_2_DEVICE_ID);

	XGpio_SetDataDirection(&finish, 1, 1);	//1 is input, 0 is output
	XGpio_SetDataDirection(&received, 1, 0);
	XGpio_SetDataDirection(&num, 1, 0);


	Running = TRUE;

	while (Running) {
		if(XGpio_DiscreteRead(&finish, 1)){
		 /* Wait until there is data */
			while (!XUartPs_IsReceiveData(UART_BASEADDR));

			RecvChar = XUartPs_ReadReg(UART_BASEADDR,
							XUARTPS_FIFO_OFFSET);

			if (CHAR_ESC == RecvChar) {
				Running = FALSE;
			}
			else {
				print("SSSSSSSS\n\r");
				XGpio_DiscreteWrite(&num, 1, RecvChar);	//write the char
				XGpio_DiscreteWrite(&received, 1, 1);	//write 1
			}
			/* Echo the character back */
			XUartPs_WriteReg(UART_BASEADDR,  XUARTPS_FIFO_OFFSET,
					  RecvChar);
		}
		XGpio_DiscreteWrite(&received, 1, 0);
	}

    print("Finish");

    cleanup_platform();
    return 0;
}
