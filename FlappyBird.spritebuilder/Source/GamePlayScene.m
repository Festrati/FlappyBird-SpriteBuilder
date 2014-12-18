#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    
    [self addObstacle];
    timeSinceObstacule = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    timeSinceObstacule += delta;
    
    //checa se passou dois segundos
    if(timeSinceObstacule > 2.0f){
        
        // add obstaculo
        [self addObstacle];
        
        // reseta timer
        timeSinceObstacule = 0.0f;
    }
}

// é chamado sempre que tocam a tela
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    [character flap];
}

@end
