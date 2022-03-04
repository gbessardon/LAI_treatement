IMPLICIT NONE

integer*2,dimension(43200*3) :: lread
integer*2,dimension(43200*3) :: lwrite
integer*4 :: j, i, k, icnt0
integer*2 :: icpt
integer*4 :: irec
integer*4,dimension(16800*3) :: icpt2
integer*2 :: inb, ire
integer*4 :: ilong
integer*8 :: ipos


        open(11,file='filein2',form='unformatted',&
                access='direct',recl=43200*2*3)
        open(12,file='filein2_c',form='unformatted',&
                access='stream')
       

        irec = 0
        ipos = 16800*3*4+1

        ! boucle sur les lignes
        do j=1,16800*3
          !print*,j
          !print*,j
          ! lecture du lai
          read(11,rec=j) lread
          ! tableau qui contient la ligne de lai à écrire
          lwrite(:) = 0

          icpt2(j) = 0

          i = 1

          ! boucle sur les colonnes
          do 
           
            ! si on a dépassé la dernière colonne, on sort de la boucle
            if (i>43200*3) exit

            ! si la valeur est valide
            if (lread(i)/=1) then

                    !print*,'cas1'
              ! on la met dans lwrite à l'indice icpt
              icpt2(j) = icpt2(j) + 1
              lwrite(icpt2(j)) = lread(i)
              ! on incrémente i
              i = i+1

            else

                  !  print*,'cas2'
              ! nombre de 0 dans la ligne à partir de l'indice i
              do k = i,size(lread)
                if (lread(k)/=1) exit
              enddo
              !print*,'ki ',k,i
              icnt0 = k-i
              if (icnt0==-1) icnt0 = 43200*3-i+1
              if (icnt0>43200) then

                ilong = 43200
                inb = icnt0/43200
                ire = mod(icnt0,43200)
                do k=1,inb
                  icpt2(j) = icpt2(j) + 1
                  lwrite(icpt2(j)) = 4000+ilong
                enddo
                if (ire/=0) then
                  icpt2(j) = icpt2(j) + 1
                  lwrite(icpt2(j)) = 4000+ire
                endif

              else

                ! on met le nombre de zér0s à la suite dans lwrite indice icpt
                icpt2(j) = icpt2(j) + 1
                lwrite(icpt2(j)) = 4000+icnt0

              endif

              ! on passe à la colonne après la suite de z0
              i = i+icnt0

            endif

          enddo

          !icpt = icpt2(j)
          !if (j==7150) print*,icpt,icpt2(j)
          ! on écrit la ligne
          !irec = irec+1
        !  print*,'icpt ',icpt
          !irec = irec + 1
          !print*,irec
          !icpt2 = icpt
          !if (icpt2<0) icpt2 = 32768*2 + icpt
          !if (j>=4441.and.j<=6061) then
          !  print*,j,minval(lwrite(1:icpt2),lwrite(1:icpt2)>=400.and.lwrite(1:icpt2)<500)
          !  print*,j,maxval(lwrite(1:icpt2),lwrite(1:icpt2)>=400.and.lwrite(1:icpt2)<500)
          !endif
         ! print*,'lwrite ',lwrite(1:icpt2)
          write(12,pos=ipos) lwrite(1:icpt2(j))
          ipos = ipos + icpt2(j)*2

        enddo

        write(12,pos=1) icpt2


        close(11)
        close(12)
          
      END
