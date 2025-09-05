/*
    Project 01
    
    Requirements (for 15 base points)
    * Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] * Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

-> haunted_manor

== haunted_manor ==
Lightning flashes as you stand on the steps of a decrepit mansion. Before you sits a large mahogany door. It creaks open. Do you go in?
* [enter] -> foyer
* [leave] -> coward_ending
-> END

== coward_ending ==
You turn tail and run like a coward. Try doing something crazy for once.
->END

== foyer ==
{not upper_hallway:  There is a stairway going up.} {not lower_hallway:  There is a stairway going down.} {not middle_hallway:  There is a hallway going straight forward.}
{ upper_hallway and  middle_hallway and  lower_hallway: There is nothing left for you here.}
* [up] -> upper_hallway
* [straight] -> middle_hallway
* [down] -> lower_hallway
* [{ upper_hallway and  middle_hallway and  lower_hallway: go to the door}] -> exit
-> END

== upper_hallway ==
The hall is illuminated by a dim chandelier, {not wall_look:  and the purple wallpaper looks like hundreds of sets of eyeballs watching you.} { wall_look:  and the walls are watching your every move.} {not ghost_room: There is a large red door at the end of the hall.} { ghost_reject:  You can feel your heart pounding from the sprint you just made.} { ghost_dance:  You shiver as you leave the room, but you no longer feel cold.}
* [{ ghost_dance:  go back downstairs}] -> foyer
* [{ ghost_reject:  go back downstairs}] -> foyer
* [open the door] -> ghost_room
* [inspect the wall] -> wall_look
-> END

== wall_look ==
Did the wallpaper just blink?
* [step back] -> upper_hallway
-> END

== ghost_room ==
You step into the dark room, and as your foot lands the room is suddenly filled with a blue pallor. A dozen well-dressed ghosts materialize suddenly, and the walls echo with the sound of a forgotten waltz. The ghosts begin to pair up and dance, but one stands alone. She is looking for a dance partner when she locks eyes with you.
* [dance with her] -> ghost_dance
* [reject her] -> ghost_reject
-> END

== ghost_dance ==
You cross the room to meet her, and as your hands touch, you feel yourself imbued with a cold felt only by the dying. As the waltz finishes, she curtsies.
* [bow and dismiss yourself] -> upper_hallway
-> END

== ghost_reject ==
You turn away and face the door. The ghost, realizing your rejection, begins to sob. The other ghosts look to her, then at you. They don't seem very happy to have had their night interrupted by a mortal.
* [run!] -> upper_hallway



== middle_hallway ==
You enter a warm, beige-walled hallway. {not compass_pickup:  There is a compass on the floor beside you.} There is a turn to the left at the very end of the hall.
* [pick up the compass] -> compass_pickup
+ [take the turn at the end of the hall] -> middle_hallway
* [{compass_pickup:  inspect the compass}] -> hall_compass
-> END

== compass_pickup ==
Congratulations, you now have a compass { knife_pickup:  and a knife}!
* [Stand back up] -> middle_hallway
-> END

== hall_compass ==
It says you are facing north.
* [go down the hall and inspect the compass again] -> hall_compass2
-> END

== hall_compass2 ==
Wait a minute, you're still facing north. This hallway must go on endlessly! You turn around and the door you walked in is still there.
* [leave the hall] -> foyer
-> END

== lower_hallway ==
The stairway leads you to a large basement. The only things in the basement are a bloodied knife, a bathtub, and a spotlight illuminating the bathtub. There is a hand dangling over the side of the tub.
* [pick up the knife] -> knife_pickup
* [walk towards the tub] -> tub
-> END

== knife_pickup ==
You now have a knife {compass_pickup:  and a compass}.
* [stand back up] -> lower_hallway2
-> END

== lower_hallway2 ==
The only things down here are you, the tub, and the hand coming from it.
* [go to the tub] -> tub_knife
-> END

== tub ==
As you approach the tub, you realize that the hand is still attached to a body. As you inspect the tub, the body's eyes flash open, and it lunges at you.
* [defend yourself] -> choke_out
-> END

== tub_knife ==
As you approach the tub, you realize that the hand is still attached to a body. As you inspect the tub, the body's eyes flash open, and it lunges at you.
* [defend yourself] -> knife_fight

== choke_out ==
Since you don't have a weapon, all you can do is try to put the creature in a chokehold.
* [{ ghost_dance:  wrap your arm around the creature's neck}] -> pacify
* [{ghost_reject and not ghost_dance or not ghost_reject:  wrap your arm around the creature's neck}] -> KO
-> END

== pacify ==
The creature senses a familiar presence, as if you were one of its own. It immediately calms down and lets you go.
* [leave the basement] -> foyer
-> END

== KO ==
The creature struggles, but eventually passes out after a long and greuling chokehold.
* [leave the basement] -> foyer
-> END

== knife_fight ==
The knife in your hand glimmers in the spotlight as you bring your arms up to defend yourself.
* [slice at the creature] -> cut
-> END

== cut ==
You nick the creature on its cheek, and it runs away in fear. You should leave before it gets a mind to come back.
* [go back upstairs] -> foyer
-> END

== exit ==
As you return to the foyer, you hear what sounds like the groans of the undead. Sure enough, once you arrive, a horde of zombies fills the foyer. {ghost_dance:  however, they seem rather docile.} { ghost_reject:  They seem very hungry.}
* [{ ghost_dance:  walk past the zombies to the door}] -> dead_twist
* [{ ghost_reject:  fight your way through}] -> zombie_fight
-> END

== dead_twist ==
The zombies let you past, but once you pull on the door, it won't budge. That deathly cold you felt when you danced with the ghost? It appears you actually did die. You are now trapped in this house with your kind for all of eternity.
-> END

== zombie_fight ==
The zombies are overwhelming in number { knife_pickup:  but with your knife, they shouldn't be a problem}.
* [{not knife_pickup:  fight your way through}] -> zombie_end
* [{ knife_pickup: fight your way through}] -> escape_end
-> END

== zombie_end ==
In the end, the crowd of zombies is too overwhelming for just your bare fists. They overpower you, and you join their ranks.
-> END

== escape_end ==
You slice and dice your way through the crowd, eventually making it out of the door. You escape with your life, but who will believe you? Do you even believe yourself? How much of what you just went through was real. You may never know.
-> END