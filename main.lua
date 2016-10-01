-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")


-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

-- module
local bump         = require 'libs.bump'
local map          ={}
table.insert(map,require 'map.level01')
--list table 
  debug            = false
  list_sprite      ={}
  sprite           ={}
  player           ={}
  list_object      ={}
  list_ground_tile ={}
  list_ennemy      ={}
  list_sensor      ={}
  ground_tile      ={}
  imgTile          ={}
  score            = 0
  vie              = 3
  HighScore        ={best = 0}
  ecran_courant    = "menu"
  
-- local
local world       = bump.newWorld(8)
local ground_tile = list_ground_tile
local gravity     = 12
local scale       = 5
local chrono      = 8

-- load image
imgMenu       =  love.graphics.newImage("image/titre.png")
imgTileset    =  love.graphics.newImage("image/tilesheet.png")
imgBackground =  love.graphics.newImage("image/background.png")
imgHero       = {player     = love.graphics.newImage("image/player.png"),
                 flip       = love.graphics.newImage("image/player_flip.png")}
imgEnnemy     = {snake      = love.graphics.newImage("image/snake.png"),
                 tonneau    = love.graphics.newImage("image/tonneau.png")}
imgObject     = {princess   = love.graphics.newImage("image/princesse.png"),
                 mao_snake  = love.graphics.newImage("image/mao_snake.png"),
                 tonneau_02 = love.graphics.newImage("image/tonneau_02.png")}
               
-- load son
sonJump  = love.audio.newSource("son/Jump.wav","static")
sonScore = love.audio.newSource("son/Pickup_Coin.wav","static")
sonHurt  = love.audio.newSource("son/Hit_Hurt.wav","static")
local l,c
  for l = 0,19 do 
    for c = 0,19 do
      local tileW,tileH = 8,8
      local tilesetW,tilesetH = imgTileset:getWidth(),imgTileset:getHeight()
      table.insert(imgTile,love.graphics.newQuad(c*tileW,l*tileH,tileW,tileH,tilesetW,tilesetH))
      end
    end

function love.load()
  windowHeight = love.graphics.getHeight()
  windowWidth  = love.graphics.getWidth()
  levelLoad()
end

function restartGame()
  --vide des caches
    world:remove(player)
  for n=1,#list_ennemy      do if nil then else local ennemy = list_ennemy[n] world:remove(list_ennemy[n]) end end
  for n=1,#list_ground_tile do if nil then else local tile = list_ground_tile[n]
                               if tile.worldCol1.create == true then world:remove(tile.worldCol1) end
                               if tile.worldCol2.create == true then world:remove(tile.worldCol2) end end end
  for n=1,#list_sensor       do if nil then else local sensor = list_sensor[n] world:remove(list_sensor[n]) end end
  world:remove(limit.gauche)    world:remove(limit.droite)
 -- for n=1,#list_object      do if nil then else local object = list_object[n] world:remove(object[n]) end end
  chrono           = 8
  list_sprite      ={}
  sprite           ={}
  player           ={}
  list_object      ={}
  list_ground_tile ={}
  list_ennemy      ={}
  list_sensor      ={}
  ground_tile      ={}
  limit            ={}
  levelLoad()
end

function levelLoad()
local layer               = map[1].layers[2].data
local tileW,tileH         = map[1].tilewidth,map[1].tileheight
local maxColonne,maxLigne = map[1].width,map[1].height
local layerNum
local ligne,colonne
local pType
for ligne          = 1, maxLigne do
  for colonne      = 1,maxColonne do
    for n          = 1, #map[1].tilesets[1].tiles do
    local tileId   = map[1].tilesets[1].tiles[n].id
    local tileType = map[1].tilesets[1].tiles[n].properties.type
    if layer[((ligne-1)*maxColonne)+colonne] == tileId+1 then pType = tileType pId = tileId end   end
    local tuile = imgTile[layer[((ligne-1)*maxColonne)+colonne]]
     if   tuile == nil then else 
    ground_tileInitialize (tuile,(colonne-1)*8*scale,(ligne-1)*8*scale,tileW*scale,tileH*scale,pType,pId) end
  end
end
local object = map[1].layers[3].objects
playerInitialize(imgHero.player,object[1].x*scale, object[1].y*scale, object[1].width*scale, object[1].height*scale)
for n = 1, #object do
  if object[n].name == "tonneau" then
ennemyInitialize(imgEnnemy.tonneau,object[n].x*scale, object[n].y*scale, object[n].width*scale, object[n].height*scale, object[n]["type"]) end
  if object[n].name == "snake"   then
ennemyInitialize(imgEnnemy.snake,object[n].x*scale, object[n].y*scale, object[n].width*scale, object[n].height*scale, object[n]["type"]) end
end
local sensor = map[1].layers[4].objects
for n = 1,#sensor do
sensorInitialize(sensor[n].x*scale,sensor[n].y*scale,sensor[n].width*scale,sensor[n].height*scale,sensor[n]["type"])end
local object =map[1].layers[5].objects
for n = 1,#object do
  if object[n].name == "tonneau_02" then
objectInitialize(imgObject.tonneau_02,object[n].x*scale,object[n].y*scale,object[n].width*scale,object[n].height*scale) end 
  if object[n].name == "Mao_snake"  then
objectInitialize(imgObject.mao_snake,object[n].x*scale,object[n].y*scale,object[n].width*scale,object[n].height*scale)  end 
  if object[n].name == "Princess"   then
objectInitialize(imgObject.princess,object[n].x*scale,object[n].y*scale,object[n].width*scale,object[n].height*scale)   end     
end
limit = { gauche = {x=0, y=0, width=8, height = windowHeight, ["type"] ="solid"}, droite = {x=windowWidth-10, y=0, width=8*scale, height = windowHeight, ["type"] = "solid"}}
world:add(limit.gauche, limit.gauche.x, limit.gauche.y, limit.gauche.width, limit.gauche.height,"limitgauche")
world:add(limit.droite, limit.droite.x, limit.droite.y, limit.droite.width, limit.droite.height,"limitdroite")
end

function sensorInitialize(pX,pY,pW,pH,pType)
sensor      = spriteInitialize(nil,pX,pY,pW,pH,pType)
sensor.type = pType
world:add(sensor,sensor.x,sensor.y,sensor.height,sensor.width)
table.insert(list_sensor,sensor)
end

function spriteInitialize(pImg,pX,pY,pW,pH)
sprite        = {}
sprite.image  = pImg
sprite.x      = pX
sprite.y      = pY
sprite.width  = pW
sprite.height = pH
sprite.supprime = false
table.insert(list_sprite,sprite)
return sprite
end

function ennemyInitialize(pImg,pX,pY,pW,pH,pType)
ennemy = spriteInitialize(pImg,pX,pY,pW,pH)
ennemy.type = pType
ennemy.vx = 200
ennemy.vy = 100
ennemy.dx = 0
ennemy.dy = 0
ennemy.cols = {}
ennemy.on_ground = false
ennemy.on_climb  = false
ennemy.right     = false
ennemy.left      = false
world:add(ennemy,ennemy.x,ennemy.y,ennemy.width-20,ennemy.height)
table.insert(list_ennemy,ennemy)
return ennemy
end

function ground_tileInitialize(pImg,pX,pY,pW,pH,pType,pId)
local pixel           = 5
ground_tile           = spriteInitialize(pImg,pX,pY,pW,pH)
ground_tile.worldCol1 = {}
ground_tile.worldCol2 = {}
local worldCol1       = ground_tile.worldCol1
local worldCol2       = ground_tile.worldCol2
worldCol1.create      = false
worldCol2.create      = false
for n= 1,7 do
    if pId == 3  and n == 7 or
       pId == 4  and n == 6 or
       pId == 5  and n == 5 or
       pId == 6  and n == 4 or
       pId == 7  and n == 3 or
       pId == 8  and n == 2 or
       pId == 9  and n == 1 or
       pId == 10 and n == 7 or
       pId == 11 and n == 6 or
       pId == 12 and n == 5 or
       pId == 13 and n == 4 or
       pId == 14 and n == 3 or
       pId == 15 and n == 2 or
       pId == 16 and n == 1 
       then
    worldCol1.create = true
    worldCol1.y = pY + pixel * n
    worldCol1.x = pX
    worldCol1.width = pW 
    worldCol1.height = 1
    worldCol1.type = pType
   end
    if pId == 0 
       then
    worldCol1.create = true
    worldCol1.y = pY
    worldCol1.x = pX
    worldCol1.width = pW
    worldCol1.height = 1
    worldCol1.type = pType
  end 
    if pId == 70 and n == 7 or
       pId == 71 and n == 6 or
       pId == 72 and n == 5 or 
       pId == 73 and n == 4 or 
       pId == 74 and n == 3 or 
       pId == 75 and n == 2 or 
       pId == 76 and n == 1 
       then
    worldCol1.create = true
    worldCol1.y = pY
    worldCol1.x = pX
    worldCol1.width = pW
    worldCol1.height = pH - pixel * n
    worldCol1.type = pType
    end 
    if pId ==20 
    or pId ==1 
    or pId ==2
    or pId ==30
    or pId ==31
    or pId ==32
    or pId ==33
    or pId ==34
    or pId ==35
    or pId ==36
    or pId ==50
    or pId ==51
    or pId ==52
    or pId ==53
    or pId ==54
    or pId ==55
    or pId ==56
    or pId ==70
    or pId ==71
    or pId ==72
    or pId ==73
    or pId ==74
    or pId ==75
    or pId ==76
    then 
    worldCol1.create = true
    worldCol1.x = pX
    worldCol1.y = pY
    worldCol1.width = pW
    worldCol1.height = 1
    worldCol1.type = pType
  end
    if pId == 70  and n == 7 or
       pId == 71  and n == 6 or
       pId == 72  and n == 5 or
       pId == 73  and n == 4 or
       pId == 74  and n == 3 or
       pId == 75  and n == 2 or
       pId == 76  and n == 1 
       then
    worldCol2.create = true
    worldCol2.y = pY + pixel * n
    worldCol2.x = pX
    worldCol2.width = pW 
    worldCol2.height = 1
    worldCol2.type = "solid"
   end
end
if worldCol1.create == true then world:add(worldCol1,worldCol1.x,worldCol1.y,worldCol1.width,worldCol1.height) end
if worldCol2.create == true then world:add(worldCol2,worldCol2.x,worldCol2.y,worldCol2.width,worldCol2.height) end
table.insert(list_ground_tile,ground_tile)
end

function objectInitialize(pImg,pX,pY,pW,pH)
object      = spriteInitialize(pImg,pX,pY,pW,pH)
table.insert(list_object,object)
end

function playerInitialize(pImg,pX,pY,pW,pH)
player = spriteInitialize(pImg,pX,pY,pW,pH)
player.vx          = 200
player.vy          = 100
player.velocite_y  = 0
player.height_jump = -5.5
player.dx          = 0
player.dy          = 0
player.cols        = {}
player.on_ground   = false
player.on_climb    = false
player.on_jump     = false
player.on_scoring  = false
world:add(player,player.x,player.y,player.width-20,player.height)
end
function movePlayer(player,dt)

 local playerFilter = function(item, other)
  if     other.type == "climb"           then return 'cross'
  elseif other.type == "leftSensor"      then return 'cross'
  elseif other.type == "rightSensor"     then return 'cross'
  elseif other.type == "remove"          then return 'cross'
  elseif other.type == "pass"            then return 'cross'
  elseif other.type == "solid"           then return 'slide'
  elseif other.type == "movingRight"     then return 'slide'
  elseif other.type == "movingLeft"      then return 'slide'
  elseif other.type == "baril"           then return 'slide'
  elseif other.type == "serpent"         then return 'slide' 
  elseif other.type == "limitgauche"     then return 'slide'
  elseif other.type == "limitdroite"     then return 'slide'
  elseif other.type   then return 'touch'
  elseif other.type   then return 'bounce'
  end end
  -- else return nil
local function mortJoueur()
  sonJump:setVolume(0.5)
  sonJump:setPitch(0.8)
  sonHurt:play()
  vie = vie - 1
  score = 0
  restartGame()
end
  if  vie == 0 then  ecran_courant ="gameover" vie = 3 end
    
--moving the player
  local key = love.keyboard.isDown
  
  if key('d','right','q','left') then
  if key("d") or key("right") then player.dx = player.vx*dt player.image = imgHero.player    end 
  if key("q") or key("left")then player.dx = - player.vx*dt player.image = imgHero.flip      end
  else
  player.dx = 0
  end
  
  if player.on_ground then
    if key("space") then 
      sonJump:setVolume(0.5)
      sonJump:setPitch(0.8)
      sonJump:play()
      player.dy = player.height_jump
      player.on_jump = true
    end
 end
 
  if not player.on_ground and not player.on_climb or player.on_jump then
  player.dy = player.dy + gravity*dt
end

for n = 1, #list_ennemy do
  local ennemy = list_ennemy[n]
      if  player.x + player.width       < ennemy.x + ennemy.width    and
          player.x + player.width       > ennemy.x - 15              and 
          player.y + player.height      < ennemy.y - 15              and 
          player.y + player.height + 70 > ennemy.y + ennemy.height   and 
      not player.on_scoring                                          and
          player.on_jump                                             then
          sonJump:setVolume(0.5)
          sonJump:setPitch(0.8)
          sonScore:play()
        score = score + 100
        player.on_scoring = true
      end
    end

  local goalX,goalY =  player.x,player.y
  local actualX, actualY,cols, len = world:move(player,goalX+player.dx,goalY+player.dy,playerFilter)  
  player.on_ground  = false
  player.on_climb   = false
  player.x,player.y = actualX,actualY
  player.cols       = cols

-- gestion des collisions
  for _,cols in ipairs (player.cols) do 
-- tiles collision 
    if cols.other.type == "solid"       then playerFilter(ennemy,cols)  end
    if cols.other.type == "movingRight" then playerFilter(ennemy,cols)  end
    if cols.other.type == "movingLeft"  then playerFilter(ennemy,cols)  end
    if cols.other.type == "leftSensor"  then playerFilter(ennemy,cols)  end
    if cols.other.type == "rightSensor" then playerFilter(ennemy,cols)  end
    if cols.other.type == "pass"        then playerFilter(ennemy,cols)  end
    if cols.normal.y  == - 1 and cols.other.type =="solid" then
      player.dy         = 0      player.on_ground  = true
      player.on_jump    = false  player.on_scoring = false end
    if cols.normal.x == -1 and cols.other.type =="solid" then
      player.y = player.y - 3
    end
     if cols.normal.x == 1 and cols.other.type =="solid" then
      player.y = player.y - 3
    end
    if cols.other.type == "pass"  then ecran_courant="victoire" 
                                       vie   = 3
                                       score = 0 
                                       restartGame() end
    if cols.other.type == "climb" then playerFilter(player,cols)
       player.on_climb = true
    if player.on_jump then          return nil end
       player.dy = 0
    if player.y - player.width <= cols.other.y then
       player.on_ground = true                 end  
    if key("s") or key("down")          then player.y = player.y + player.vy*dt  end
    if key("z") or key("up")            then player.y = player.y - player.vy*dt  end end 
    if cols.other.type == "serpent"     then mortJoueur() end
    if cols.other.type == "baril"       then mortJoueur() end
    if cols.other.type == "movingRight" and cols.normal.y == -1 then  player.x = player.x + 4 end
    if cols.other.type == "movingLeft"  and cols.normal.y == -1 then player.x = player.x - 4  end  
   end
end

function moveEnnemy(ennemy,dt)
 
 local playerFilter = function(item, other)
  if     other.type == "climb"           then return 'cross'
  elseif other.type == "leftSensor"      then return 'cross'
  elseif other.type == "rightSensor"     then return 'cross'
  elseif other.type == "remove"          then return 'cross'
  elseif other.type == "solid"           then return 'slide'
  elseif other.type == "movingRight"     then return 'slide'
  elseif other.type == "movingLeft"      then return 'slide'
  elseif other.type == "baril"           then return 'slide'
  elseif other.type == "serpent"         then return 'slide' 
  elseif other.type == "limitgauche"     then return 'slide'
  elseif other.type == "limitdroite"     then return 'slide'
  elseif other.type   then return 'touch'
  elseif other.type   then return 'bounce'
  end end
  -- else return nil
  
  
--moving the ennemy 

  if ennemy.type == "baril" then
                         ennemy.dx =  ennemy.vx *dt
   if ennemy.right then  ennemy.dx =  ennemy.vx *dt end
   if ennemy.left  then  ennemy.dx = -ennemy.vx *dt end
 end
 
 
  if not ennemy.on_ground and not ennemy.on_climb or ennemy.on_jump then
  ennemy.dy = ennemy.dy + gravity*dt
end


  local goalX,goalY =  ennemy.x,ennemy.y
  local actualX, actualY,cols, len = world:move(ennemy,goalX+ennemy.dx,goalY+ennemy.dy,playerFilter)  
  ennemy.on_ground  = false
  ennemy.on_climb   = false
  ennemy.x,ennemy.y = actualX,actualY
  ennemy.cols       = cols
-- gestion des collisions
  for _,cols in ipairs (ennemy.cols) do 
-- tiles collision 
    if cols.other.type == "solid"       then playerFilter(ennemy,cols)  end
    if cols.other.type == "movingRight" then playerFilter(ennemy,cols)  end
    if cols.other.type == "movingLeft"  then playerFilter(ennemy,cols)  end
    if cols.other.type == "leftSensor"  then playerFilter(ennemy,cols)  end
    if cols.other.type == "rightSensor" then playerFilter(ennemy,cols)  end
    if cols.other.type == "limitgauche" then playerFilter(ennemy,cols)  end
    if cols.other.type == "limitdroite" then playerFilter(ennemy,cols)  end
    if cols.other.type == "solid" and cols.normal.y == - 1 then
      ennemy.dy         = 0       ennemy.on_ground  = true
      ennemy.on_jump    = false   ennemy.on_scoring = false end
    if cols.other.type =="leftSensor" then
    ennemy.left = true
    ennemy.right = false
   end
    if cols.other.type =="rightSensor" then
    ennemy.left = false
    ennemy.right = true
    end
    if cols.normal.x == -1 and cols.other.type =="solid" then
      ennemy.y = ennemy.y - 3
    end
     if cols.normal.x == 1 and cols.other.type =="solid" then
      ennemy.y = ennemy.y - 3
    end
    if cols.other.type == "climb" then playerFilter(ennemy,cols)
      ennemy.on_climb = true
      ennemy.dy = 0
      if ennemy.y - ennemy.width <= cols.other.y then
        ennemy.on_ground = true end  end 
    if cols.other.type == "movingRight" and cols.normal.y == -1 then ennemy.x = ennemy.x + 4 end
    if cols.other.type == "movingLeft"  and cols.normal.y == -1 then ennemy.x = ennemy.x - 4 end  
    if cols.other.type == "remove"  then 
     ennemy.supprime = true  
     -- supprimeEnnemy()
    end
   end
end

function supprimeEnnemy()
     for n= #list_ennemy,1,-1 do
local result = world:hasItem(list_ennemy[n])
      print(result)
      print("suppression",list_ennemy[n])
      if list_ennemy[n].supprime then
       world:remove(list_ennemy[n])
       table.remove(list_sprite,n)
      end
     end
    end

function barilSpawner(dt)
chrono = chrono + 2*dt
local sensor = map[1].layers[4].objects
local object = map[1].tilesets[3]
if chrono >= 10 then ennemyInitialize(imgEnnemy.tonneau,sensor[4].x*scale, sensor[4].y*scale, object.imagewidth*scale, object.imageheight*scale, "baril") chrono = 0 end
end

function update_jeu(dt)
  movePlayer(player,dt)
  barilSpawner(dt)
  for n= 1,#list_ennemy do
  local ennemy = list_ennemy[n]
    moveEnnemy(ennemy,dt)
  end 
end

function update_menu(dt)
 function love.keypressed (key) if key =="space"  or key =="return" then
  ecran_courant = "jeu" end end
end

function update_victoire(dt)
 function love.keypressed (key) 
  if key == "space" or key =="return" then
   ecran_courant ="menu" end
  end
end

function update_gameover(dt)
 function love.keypressed (key) 
  if key == "space" or key == "return" then
   ecran_courant ="menu" end
  end
end

function love.update(dt)
if     ecran_courant == "menu"     then update_menu(dt)
elseif ecran_courant == "jeu"      then update_jeu (dt)       
elseif ecran_courant == "victoire" then update_victoire (dt)  
elseif ecran_courant == "gameover" then update_gameover (dt)  end
end

function drawHud()
love.graphics.setColor(224,248,208)
love.graphics.rectangle("fill",0,0,windowWidth,8*scale)
love.graphics.setColor(48,104,80)
love.graphics.print("Vie : "..vie.."    Score : ".. score.."  High Score : "..HighScore.best, 0,0)
love.graphics.setColor(255,255,255)
end

function drawTile()
  for n = 1,#list_ground_tile do
   local o = list_ground_tile[n]
   if debug then
     local Wc1 =o.worldCol1
     local Wc2 =o.worldCol2
     if Wc1.create then
     love.graphics.setColor(255,0,0,100)
     love.graphics.rectangle("fill",Wc1.x,Wc1.y,Wc1.width*scale,Wc1.height*scale)
     love.graphics.setColor(255,255,255,255) 
     end
    if Wc2.create then
     love.graphics.setColor(180,0,230,100)
     love.graphics.rectangle("fill",Wc2.x,Wc2.y,Wc2.width*scale,Wc2.height*scale)
     love.graphics.setColor(255,255,255,255)
   end
   end
  love.graphics.draw(imgTileset,o.image,o.x,o.y,0,scale)
end
end

function drawEnnemy()
 for n= 1,#list_ennemy do
   local e = list_ennemy[n]
   if debug then
   love.graphics.setColor(0,0,200,100)
   love.graphics.rectangle("fill",e.x,e.y,e.width,e.height)
   love.graphics.setColor(255,255,255,255) 
   end
   love.graphics.draw(e.image,e.x,e.y,0,scale)
  end
end

function drawPlayer()
  local p =player
  if debug then
  love.graphics.setColor(200,50,0,100)
  love.graphics.rectangle("fill",p.x,p.y,p.width-20,p.height)
  love.graphics.setColor(255,255,255,255) 
  end
  love.graphics.draw(p.image,p.x,p.y,0,scale)
end


function drawObject()
for n= 1,#list_object do
  local o = list_object[n]
  if debug then
   love.graphics.setColor(0,0,200,100)
   love.graphics.rectangle("fill", o.x, o.y, o.width, o.height)
   love.graphics.setColor(255,255,255,255) 
  end
   love.graphics.draw(o.image,o.x,o.y,0,scale)
  end
end

function drawGame()
love.graphics.draw(imgBackground,0,0,0,scale,scale)
drawTile()
drawEnnemy()
drawObject()
drawPlayer()
drawHud()
end

function drawDefaite()
love.graphics.draw(imgBackground,0,0,0,scale,scale)
love.graphics.setColor(48,104,80)
love.graphics.print("Game Over",windowWidth/2,windowHeight/2)
love.graphics.setColor(255,255,255,255) 
end

function drawVictoire()
love.graphics.draw(imgBackground,0,0,0,scale,scale)
love.graphics.setColor(48,104,80)
love.graphics.print("Bravo, vous avez secouru la princesse !",windowWidth/2,windowHeight/2)
love.graphics.setColor(255,255,255,255) 
end

function drawMenu()
love.graphics.draw(imgMenu,0,0,0,3)
end

function love.draw()
if     ecran_courant == "menu"      then drawMenu()
elseif ecran_courant == "jeu"       then drawGame() 
elseif ecran_courant == "victoire"  then drawVictoire()
elseif ecran_courant == "gameover"  then drawDefaite() end
end