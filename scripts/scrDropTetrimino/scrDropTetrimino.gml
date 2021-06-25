function scrDropTetrimino() {
	var tetriminoData = variable_struct_get(tetrimino, currentTetrimino);
	var tetriminoPattern = tetriminoData.pattern[currentRoll];
	var tetriminoOffset = tetriminoData.offset;
	
	var gridWidth = ds_grid_width(tetriminoPattern) - 1;
	var gridHeight = ds_grid_height(tetriminoPattern) - 1;
	
	var hardDropY = scrGetHardDropY();
	
	for (var i = 0; i < 4; i += 1) {
		var tetriminoX = ds_grid_value_x(tetriminoPattern, 0, 0, gridWidth, gridHeight, i + 1) + currentX - tetriminoOffset;
		var tetriminoY = ds_grid_value_y(tetriminoPattern, 0, 0, gridWidth, gridHeight, i + 1) + hardDropY - tetriminoOffset;
	
		ds_grid_set(field, tetriminoX, tetriminoY, currentTetrimino);
	}
	
	currentTetrimino = scrPickTetrimino();
	currentX = 4;
	currentY = 1;
	currentRoll = 0;
	life = maxLife;
}