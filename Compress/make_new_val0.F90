IMPLICIT NONE

integer*1,dimension(43200*3) :: lread
integer*1,dimension(43200*3) :: leco
integer*2,dimension(43200*3) :: lwrite
integer*4 :: j, i, k
integer*8, dimension(3,2) :: icpt


open(11,file='/data/gbessardon/ECOCLIMAP-SG/COVER/ecosg_final_map.dir',form='unformatted',access='direct',recl=43200*3)
open(12,file='filein',form='unformatted',access='direct',recl=43200*3)
open(13,file='filein2',form='unformatted',access='direct',recl=43200*3*2)


do j=1,16800*3

  read(12,rec=j) lread
  do i=1,size(lread)
    if (lread(i)>100.or.lread(i)<-1) print*,"problem, val < -1!"
  enddo

  !do k=1,3

    lwrite(:) = 0
    read(11,rec=10*360+j) leco(:)
    do i=1,size(leco)
      if (lread(i)==-1.or.leco(i)<7) then
        lwrite(i) = 1
      !elseif (leco(i)>23) then
      !  if (leco(i)==32) then
      !    lwrite(i) = leco(i)*100 + max(lread(i)*2,70)
      !    if (lread(i)>35) then
      !      icpt(1,1) = icpt(1,1) + 1
      !      !print*,'cas1 ',j,i,lread(i)
      !    else
      !      icpt(1,2) = icpt(1,2) + 1
      !    endif
      !  elseif (leco(i)>26.and.leco(i)<30) then
      !    lwrite(i) = leco(i)*100 + max(nint(float(lread(i))*10./3.),70)
      !    if (lread(i)>21) then
      !      icpt(2,1) = icpt(2,1) + 1
      !      !print*,'cas2 ',j,i,lread(i)
      !    else
      !      icpt(2,2) = icpt(2,2) + 1
      !    endif
      !  else
      !    lwrite(i) = leco(i)*100 + max(nint(float(lread(i))*10),70)
      !    if (lread(i)>7) then
      !      icpt(3,1) = icpt(3,1) + 1
      !      !print*,'cas3 ',j,i,lread(i)
      !    else
      !      icpt(3,2) = icpt(3,2) + 1
      !    endif
      !  endif
      else
        lwrite(i) = leco(i)*100 + lread(i)
      endif
    enddo
    write(13,rec=j) lwrite

  !enddo

enddo

print*,'cas1 ',icpt(1,1),icpt(1,2)
print*,'cas2 ',icpt(2,1),icpt(2,2)
print*,'cas3 ',icpt(3,1),icpt(3,2)

close(11)
close(12)
close(13)

      END
