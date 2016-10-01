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
  list_sprite      ={}
  sprite           ={}
  player           ={}
  list_object      ={}
  list_ground_tile ={}
  list_ennemy      ={}
  ground_tile      ={}
  imgTile          ={}
  score            = 0
  HighScore        ={best = 0}
  vie              = 3
  ecran_courant    = "menu"
-- local
local world =bump.newWorld(8)
local ground_tile = list_ground_tile
local gravity = 16
local scale = 5
-- load image
imgMenu = love.graphics.newImage("image/titre.png")
imgTileset = love.graphics.newImage("image/tilesheet.png")
imgBackground = love.graphics.newImage("image/background.png")
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
  windowWidth = love.graphics.getWidth()
  levelLoad()
end

function restartGame()
  --vide des caches
    world:remove(player)
  for n=1,#list_ennemy      do if nil then else local ennemy = list_ennemy[n] world:remove(list_ennemy[n]) end end
  for n=1,#list_ground_tile do if nil then else local ennemy = list_ground_tile[n] world:remove(list_ground_tile[n]) end end
 -- for n=1,#list_object      do if nil then else local ennemy = list_object[n] world:remove(list_object[n]) end end
  list_sprite      ={}
  sprite           ={}
  player           ={}
  list_object      ={}
  list_ground_tile ={}
  list_ennemy      ={}
  ground_tile      ={}
  levelLoad()
end

function levelLoad()
local layer = map[1].layers[2].data
local tileW,tileH = map[1].tilewidth,map[1].tileheight
local maxColonne,maxLigne = map[1].width,map[1].height
local layerNum
local ligne,colonne
local pType
for ligne = 1,maxLigne do
  for colonne = 1,maxColonne do
    if layer[((ligne-1)*maxColonne)+colonne] == 1 or 4 or 5 or 6 or 7 or 8 or 9 or 10 then pType = "solid" end
    if layer[((ligne-1)*maxColonne)+colonne] == 2                then pType = "climb" end
    if layer[((ligne-1)*maxColonne)+colonne] == 4                then pType = "movingRight" end
    if layer[((ligne-1)*maxColonne)+colonne] == 22               then pType = "movingLeft" end
    local tuile = imgTile[layer[((ligne-1)*maxColonne)+colonne]]
     if tuile == nil then else 
    ground_tileInitialize (tuile,(colonne-1)*8*scale,(ligne-1)*8*scale,tileW*scale,tileH*scale,pType) end
  end
end
end

function spriteInitialize(pImg,pX,pY,pW,pH)
sprite = {}
sprite.image = pImg
sprite.x = pX
sprite.y = pY
sprite.width = pW
sprite.height = pH
table.insert(list_sprite,sprite)
return sprite
end

function ennemyInitialize(pImg,pX,pY,pW,pH,pType)
ennemy = spriteInitialize(pX,pY,pW,pH)
ennemy.type = pType
ennemy.vx = 200
ennemy.vy = 100
ennemy.dx = 0
ennemy.dy = 0
ennemy.cols = {}
ennemy.on_ground = false
ennemy.on_climb = false
world:add(ennemy,ennemy.x,ennemy.y,ennemy.width,ennemy.height)
table.insert(list_ennemy,ennemy)
end

function ground_tileInitialize(pImg,pX,pY,pW,pH,pType)
ground_tile = spriteInitialize(pImg,pX,pY,pW,pH)
ground_tile.type =pType
world:add(ground_tile,ground_tile.x,ground_tile.y,ground_tile.width,ground_tile.height)
table.insert(list_ground_tile,ground_tile)
end

function objectInitialize(pX,pY,pW,pH,pType)
object = spriteInitialize(pX,pY,pH,pType)
object.type = pType
table.insert(list_object,object)
end

function playerInitialize(pX,pY,pW,pH)
player = spriteInitialize(pX,pY,pW,pH)
player.vx = 200
player.vy = 100
player.velocite_y = 0
player.height_jump = -5.5
player.dx = 0
player.dy = 0
player.cols = {}
player.on_ground = false
player.on_climb = false
player.on_jump = false
player.on_scoring = false
world:add(player,player.x,player.y,player.width,player.height)
end
function movePlayer(player,dt)
 
 local playerFilter = function(item, other)
  if     other.type == "climb" then return 'cross'
  elseif other.type == "solid" or "movingRight" or "movingLeft" or "baril" or "flamme" then return 'slide'
  elseif other.type   then return 'touch'
  elseif other.type   then return 'bounce'
  end
  -- else return nil
end

local function mortJoueur()
vie = vie -1
score = 0

restartGame()
end
--moving the player
  local key = love.keyboard.isDown
  
  if key('d','right','q','left') then
  if key("d") or key("right") then player.dx = player.vx*dt  end 
  if key("q") or key("left")then player.dx = - player.vx*dt end
  else
  player.dx = 0
  end
  
  if player.on_ground then
    if key("space") then 
      player.dy = player.height_jump
      player.on_jump = true
    end
 end
 
  if not player.on_ground and not player.on_climb or player.on_jump then
  player.dy = player.dy + gravity*dt
end

for n = 1, #list_ennemy do
  local ennemy = list_ennemy[n]
      if player.y < ennemy.y and player.y > ennemy.y - ennemy.height -35 and player.x > ennemy.x and player.x < ennemy.x + ennemy.width and not player.on_scoring then
        print("rajoute de score")
        score = score + 100
        player.on_scoring = true
      end
    end


  local goalX,goalY =  player.x,player.y
  local actualX, actualY,cols, len = world:move(player,goalX+player.dx,goalY+player.dy,playerFilter)  
  player.on_ground = false
  player.on_climb = false
  player.x,player.y = actualX,actualY
  player.cols = cols

-- gestion des collisions
  for _,cols in ipairs (player.cols) do 
-- tiles collision 
    if cols.other.type == "solid" or "movingRight" or "movingLeft" then 
    playerFilter(player,cols)
      if cols.normal.y == - 1 then
      player.dy = 0
      player.on_ground = true
      player.on_jump = false
      player.on_scoring = false
      end
    end
    if cols.other.type == "climb" then playerFilter(player,cols)
      player.on_climb = true
    if player.on_jump then return nil end
      player.dy = 0
      if player.y - player.width <= cols.other.y then
      player.dy = player.dy -0.1  player.on_ground = true end  
    if key("s") or key("down")then player.y = player.y + player.vy*dt end
    if key("z") or key("up")  then player.y = player.y - player.vy*dt  end end 
    if cols.other.type == "flamme" then mortJoueur() end
    if cols.other.type == "baril"  then mortJoueur() end
    if cols.other.type == "movingRight" and cols.normal.y == -1 then  player.x = player.x + 4 end
    if cols.other.type == "movingLeft"  and cols.normal.y == -1 then player.x = player.x - 4 end  
   end
end

function moveEnnemy(ennemy,dt)
   local ennemyFilter = function(item, other)
  if     other.type == "climb" then return 'cross'
  elseif other.type == "solid" or "movingRight" or "movingLeft" then return 'slide'
  elseif other.type   then return 'touch'
  elseif other.type   then return 'bounce'
  end
  -- else return nil
end

  local key = love.keyboard.isDown
   
--moving the ennemy 
  if ennemy.on_ground then
    if key("space") then 
      if ennemy.velocite_y == 0 then 
      ennemy.dy = ennemy.height_jump
      end
    end
 end
 
  if not ennemy.on_ground and not ennemy.on_climb then
  ennemy.dy = ennemy.dy + gravity*dt
  end
  

  local goalX,goalY =  ennemy.x,ennemy.y
  local actualX, actualY,cols, len = world:move(ennemy,goalX+ennemy.dx,goalY+ennemy.dy,ennemyFilter)  
  ennemy.on_ground = false
  ennemy.on_climb = false
  ennemy.x,ennemy.y = actualX,actualY
  ennemy.cols = cols

-- gestion des collisions
  for _,cols in ipairs (ennemy.cols) do 
-- tiles collision
    if cols.other.type == "solid" or "movingRight" or "movingLeft" then 
    ennemyFilter(ennemy,cols)
      if cols.normal.y == - 1 then
      ennemy.dy = 0
      ennemy.on_ground = true
      end
    end
    if cols.other.type == "climb" then ennemyFilter(ennemy,cols)
      ennemy.on_climb = true
      ennemy.dy = 0
      if ennemy.y - ennemy.width <= cols.other.y then
      ennemy.dy = ennemy.dy -0.1  ennemy.on_ground = true end  
    if key("s") or key("down")then ennemy.y = ennemy.y + ennemy.vy*dt end
    if key("z") or key("up")  then ennemy.y = ennemy.y - ennemy.vy*dt end end 
    if cols.other.type == "movingRight" and cols.normal.y == -1 then ennemy.x = ennemy.x + 4 end
    if cols.other.type == "movingLeft" and cols.normal.y == -1 then ennemy.x = ennemy.x - 4 end        
   end
end

function update_jeu(dt)
--[[  movePlayer(player,dt)
  
  for n= 1,#list_ennemy do
  local ennemy = list_ennemy[n]
    moveEnnemy(ennemy,dt)
  end ]]
end

function update_menu(dt)
 function love.keypressed (key) if key == "return" then
  ecran_courant = "jeu" end end
end

function love.update(dt)
if     ecran_courant == "menu"     then update_menu(dt)
elseif ecran_courant == "jeu"      then update_jeu(dt)  end
end

function drawHud()
love.graphics.setColor(0,25,3)
love.graphics.rectangle("fill",0,0,windowWidth,8*scale)
love.graphics.setColor(255,255,255)
love.graphics.print("Vie : "..vie.."    Score : ".. score.."  High Score : "..HighScore.best, 0,0)
end

function drawTile()
  for n = 1,#list_ground_tile do
   local o = list_ground_tile[n]
  love.graphics.draw(imgTileset,o.image,o.x,o.y,0,scale,scale)
end
end

function drawEnnemy()
 for n= 1,#list_ennemy do
   local e = list_ennemy[n]
   love.graphics.setColor(0,0,230)
   love.graphics.rectangle("fill",e.x,e.y,e.width,e.height)
  end
end

function drawPlayer()
  local p =player
  love.graphics.setColor(200,50,0)
  love.graphics.rectangle("fill",p.x,p.y,p.width,p.height)
end

function drawGame()
love.graphics.draw(imgBackground,0,0,0,scale,scale)
drawTile()
--drawEnnemy()
--drawPlayer()
drawHud()
end

function drawMenu()
love.graphics.draw(imgMenu,0,0,0,3)
end
function love.draw()
if     ecran_courant == "menu" then drawMenu()
elseif ecran_courant == "jeu"  then drawGame() end
end