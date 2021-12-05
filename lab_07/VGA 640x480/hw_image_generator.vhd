LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hw_image_generator IS
  GENERIC(
   pixels_y :  INTEGER := 90;   --row that first color will persist until
   pixels_x :  INTEGER := 90);  --column that first color will persist until
  PORT(
    disp_ena :  IN   STD_LOGIC;  	--display enable ('1' = display time, '0' = blanking time)
    row      :  IN   INTEGER;    	--row pixel coordinate
    column   :  IN   INTEGER;    	--column pixel coordinate
    dire     :  IN   STD_LOGIC;    	--move direita
	 esqu     :  IN   STD_LOGIC;    	--move esquerda
	 cima     :  IN   STD_LOGIC;    	--move cima
	 baixo    :  IN   STD_LOGIC;    	--move baixo
	 clk      :  IN   STD_LOGIC; 		--clock para proteger move
	 corfundo :  IN   STD_LOGIC;    	--muda cor do fund
	 sel_mov  :  IN	STD_LOGIC;		--escolhe quadrado para movimentar
    red      :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
    green    :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
    blue     :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')); --blue magnitude output to DAC
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS
 signal  anda_x_1 :  INTEGER :=200;
 signal  anda_y_1 :  INTEGER :=200;
 
BEGIN
	PROCESS(disp_ena, row, column, dire, esqu, clk)  BEGIN
		IF(CLK'EVENT AND CLK='1')THEN
			
			IF (sel_mov == 0) THEN
				IF (dire = '0' AND anda_x_1 < 560 ) THEN
					anda_x_1 <= anda_x_1+1;
				END IF;
				IF ( esqu = '0' AND anda_x_1 > -40) THEN
					anda_x_1 <= anda_x_1-1;
				END IF;
				IF (cima = '0' AND anda_y_1 < 380 ) THEN
					anda_y_1 <= anda_y_1+1;
				END IF;
				IF ( baixo = '0' AND anda_y_1 > -60) THEN
					anda_y_1 <= anda_y_1-1;
				END IF;
			ELSE
				IF (dire = '0' AND anda_x_2 < 560 ) THEN
					anda_x_2 <= anda_x_2+1;
				END IF;
				IF ( esqu = '0' AND anda_x_2 > -40) THEN
					anda_x_2 <= anda_x_2-1;
				END IF;
				IF (cima = '0' AND anda_y_2 < 380 ) THEN
					anda_y_2 <= anda_y_2+1;
				END IF;
				IF ( baixo = '0' AND anda_y_2 > -60) THEN
					anda_y_2 <= anda_y_2-1;
				END IF;
			END IF
			
		END IF;
		IF(disp_ena = '1') THEN        --display time
			IF( row > (pixels_y+anda_x_1-50)  AND row < (pixels_y+anda_x_1) AND column < (pixels_x+anda_y_1) AND column > (pixels_x+anda_y_1-30)) THEN
	  
					IF (corfundo='0')THEN --muda cor do fundo
						blue   <= (OTHERS => '1');
						green <= (OTHERS => '0');
						red    <= (OTHERS => '0');
					ELSE
						green <= (OTHERS => '1');
						red    <= (OTHERS => '1');
						blue   <= (OTHERS => '0');
					END IF;
				
			ELSIF( row > (pixels_y+anda_x_2-50)  AND row < (pixels_y+anda_x_2) AND column < (pixels_x+anda_y_2) AND column > (pixels_x+anda_y_2-30)) THEN
	  
					IF (corfundo='0')THEN --muda cor do fundo
						blue   <= (OTHERS => '1');
						green <= (OTHERS => '0');
						red    <= (OTHERS => '0');
					ELSE
						green <= (OTHERS => '1');
						red    <= (OTHERS => '1');
						blue   <= (OTHERS => '0');
					END IF;
			
			ELSE
			
				IF (corfundo='0')THEN
					green <= (OTHERS => '0');
					red <= (OTHERS => '1');
				ELSE
					green <= (OTHERS => '1');
					red <= (OTHERS => '0');
				END IF;
			END IF;
			
		ELSE
			red <= (OTHERS => '0');
			green <= (OTHERS => '0');
			blue <= (OTHERS => '0');
		END IF;
	END PROCESS;
END behavior;
