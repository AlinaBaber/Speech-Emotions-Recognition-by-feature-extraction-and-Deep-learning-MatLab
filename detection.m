function [Status]= detection(Dist)
if(Dist<0 || Dist>100)
       Status ='Language disorder.';
else
      Status ='Normal Language.';
end
