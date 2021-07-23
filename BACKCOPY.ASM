;
;
; Backup Assembly Support Routines.
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;................................................................

         absaddr on
         keep BackCopy

         mload BackCopy.macro

;................................................................
;
; CopyToBuffer
; ~~~~~~~~~~~~
; Will copy a specified number of bytes from a source address to
; the work area.  If the end of the buffer is detected before all
; bytes are copied, the function returns the number of bytes that
; remain to be copied, otherwise, it returns a zero value.
;
; If the source address is NIL, then the function will zero the
; specified number of bytes in the work area from the current
; position in the work area.
;................................................................

CopyToBuffer start

Dest         equ $00
EndOfBuf     equ $04

         subroutine (4:Source,4:ByteCount),8

         add4  WorkArea,WorkBufferSize,EndOfBuf   ;Determine the final address
;                                                 in the buffer.

;        Add byte index onto base address so that the copy process adds to
;        the end of the current contents of the buffer.

         add4  ByteIndex,WorkArea,Dest

         clc                            ;Determine whether the source address
         lda   Source                   ;is a NIL pointer.
         adc   Source+2
         beq   ZroBuffr                 ;It is NIL, so zero the buffer.

;        We don't want to zero the buffer, so initiate and carry out the
;        copy process.

CopyByte shortm                         ;We only want 8 bit memory and Acc
;                                        for the copy process.
         lda   [Source]                 ;Copy a byte.
         sta   [Dest]
         longm                          ;Restore the memory and Acc to 16 bits.
         inc4  Source                   ;Alter the pointers for next byte.
         inc4  Dest
         dec4  ByteCount                ;Decrement byte counter.
         bne   ChkTop1                  ;There are more bytes to copy.
         ldx   ByteCount                ;Final check of byte counter.
         beq   DoneCopy                 ;None left ?
ChkTop1  ldx   Dest                     ;>No. Check to see if we have reached
         cpx   EndOfBuf                 ;>the end of the buffer.
         beq   RchdTop                  ;>>Yes we have, so exit.
         bra   CopyByte                 ;>>No. Go and copy another byte.

ZroBuffr lda   #0
ZeroByte shortm                         ;We only want 8 bit memory and Acc
;                                        for the zero process.
         sta   [Dest]                   ;Zero the byte.
         longm                          ;Restore the memory and Acc to 16 bits.
         inc4  Dest                     ;Increment the pointer.
         dec4  ByteCount                ;Decrement byte counter.
         bne   ChkTop2                  ;There are more bytes to copy.
         ldx   ByteCount                ;Final check of byte counter.
         beq   DoneZero                 ;None left ?
ChkTop2  ldx   Dest                     ;>No. Check to see if we have reached
         cpx   EndOfBuf                 ;>the end of the buffer.
         beq   RchdTop                  ;>>Yes we have, so exit.
         bra   ZeroByte                 ;>>No. Zero another byte.

DoneZero anop                           ;Zero operation complete.
DoneCopy anop                           ;Copy operation complete.
RchdTop  Return 4:ByteCount             ;Return the number of bytes left.

         end

;................................................................
;
; CopyFromBuffer
; ~~~~~~~~~~~~~~
; Will copy a specified number of bytes from a the work area at
; the point indicated by ByteIndex to the address specified.
; If the end of the buffer is detected before all bytes are copied,
; the function returns the number of bytes that remain to be
; copied, otherwise, it returns a zero value.
;................................................................

CopyFromBuffer start

Source       equ $00
EndOfBuf     equ $04

         subroutine (4:Dest,4:ByteCount),8

         add4  WorkArea,WorkBufferSize,EndOfBuf   ;Determine the final address
;                                                 in the buffer.

;        Add byte index onto base address so that the copy process copies
;        from the correct place in the buffer.

         add4  ByteIndex,WorkArea,Source

CopyByte shortm                         ;We only want 8 bit memory and Acc
;                                        for the copy process.
         lda   [Source]                 ;Copy a byte.
         sta   [Dest]
         longm                          ;Restore the memory and Acc to 16 bits.
         inc4  Source                   ;Alter the pointers for next byte.
         inc4  Dest
         dec4  ByteCount                ;Decrement byte counter.
         bne   ChkTop1                  ;There are more bytes to copy.
         ldx   ByteCount                ;Final check of byte counter.
         beq   DoneCopy                 ;None left ?
ChkTop1  ldx   Source                   ;>No. Check to see if we have reached
         cpx   EndOfBuf                 ;>the end of the buffer.
         beq   RchdTop                  ;>>Yes we have, so exit.
         bra   CopyByte                 ;>>No. Go and copy another byte.

DoneCopy anop                           ;Copy operation complete.
RchdTop  Return 4:ByteCount             ;Return the number of bytes left.

         end
