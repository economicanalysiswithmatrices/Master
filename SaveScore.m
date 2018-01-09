function SaveScore(Score,Answer)
    
Answer = lower(Answer); % sets variable 'Answer' to equal 'Answer' in lower case

Name = inputdlg(sprintf('Your word "%s" scored %s. Please enter your name to save your score', Answer,Score)); 
% sets variable 'Name' to equal phrase shown
    
    if(~isempty(Name))
        
        Name = strrep(Name,' ','_');

        NameString = Name{1,1};
        
        HighestScoreFile = fopen('HighestScorer.txt', 'rt');

        HighestScorer = textscan(HighestScoreFile, '%s', 'delimiter', '\n');
        
        Count = 0;

        if(~isempty(HighestScorer{1,1}))
            HighestScorer = HighestScorer{1,1}{1,1};
            
            for i=1:length(HighestScorer)
               Letter = HighestScorer(1,i);
               if(Letter == ',')
                   Count = Count + 1;
               end
               if(Count == 2)
                   if(Letter ~= ',')
                   HighestStored = str2num(Letter);
                   ScoreNumber = str2num(Score);
                         if(ScoreNumber > HighestStored)
                         HighestScores = fopen('HighestScorer.txt','w'); % opens file 'HighestScorer.txt'
                         fprintf(HighestScores,'%s,%s,%s\r\n',NameString,Answer,Score); % inputs name and score into 'HighestScores.txt' file
                         DisplayHighestScore % executes funtion 'DisplayHighestScore'
                         end   
                   end

               end
            end
            
    
        else
            HighestScores = fopen('HighestScorer.txt','w'); % opens file 'HighestScorer.txt'
            fprintf(HighestScores,'%s,%s,%s\r\n',NameString,Answer,Score); % inputs name and score into 'HighestScores.txt' file
            DisplayHighestScore % executes funtion 'DisplayHighestScore'
        end



        File = fopen('Scores.txt','a'); % opens file 'Scores.txt' 

        fprintf(File,'%s,%s,%s,\r\n',NameString,Answer,Score); % inputs name and score into 'Scores.txt' file
    
    else
        msgbox('You chose not save your score') % if you do not enter name displays this phrase
    end
