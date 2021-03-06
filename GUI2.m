function varargout = GUI2(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI2 is made visible.
function GUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for GUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

N = load ('username.mat')
NN = struct2cell(N)
NNN = string(NN)

set(handles.Welcome,'String',sprintf('Welcome, %s',NNN));

% --- Outputs from this function are returned to the command line.
function varargout = GUI2_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ChangeUser.
function ChangeUser_Callback(hObject, eventdata, handles)
HomeLoginUser
close(GUI2)


% --- Executes on button press in CheckRecord.
function CheckRecord_Callback(hObject, eventdata, handles)
HomeUserRecord


function edit1_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, ~, handles)
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit4_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function TemperatureField_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of TemperatureField as text
%        str2double(get(hObject,'String')) returns contents of TemperatureField as a double


% --- Executes during object creation, after setting all properties.
function TemperatureField_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function PulseRateField_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of PulseRateField as text
%        str2double(get(hObject,'String')) returns contents of PulseRateField as a double


% --- Executes during object creation, after setting all properties.
function PulseRateField_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function BGLField_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of BGLField as text
%        str2double(get(hObject,'String')) returns contents of BGLField as a double


% --- Executes during object creation, after setting all properties.
function BGLField_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function BGStatusField_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of BGStatusField as text
%        str2double(get(hObject,'String')) returns contents of BGStatusField as a double


% --- Executes during object creation, after setting all properties.
function BGStatusField_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit10_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function UBPField_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of UBPField as text
%        str2double(get(hObject,'String')) returns contents of UBPField as a double


% --- Executes during object creation, after setting all properties.
function UBPField_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LBPField_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of LBPField as text
%        str2double(get(hObject,'String')) returns contents of LBPField as a double


% --- Executes during object creation, after setting all properties.
function LBPField_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function BPStatusField_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of BPStatusField as text
%        str2double(get(hObject,'String')) returns contents of BPStatusField as a double


% --- Executes during object creation, after setting all properties.
function BPStatusField_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit14_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit15_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit16_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit17_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit18_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Selection1.
function Selection1_Callback(hObject, eventdata, handles)
set(hObject,'Enable','off')
drawnow;
set(hObject,'Enable','on')


% --- Executes during object creation, after setting all properties.
function Selection1_CreateFcn(hObject, eventdata, handles)
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in LoadFile.
function LoadFile_Callback(hObject, eventdata, handles)
% hObject    handle to LoadFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile('*.csv');
fullpathname = strcat(pathname, filename);
set(handles.FilenameField,'String',fullpathname);

% --- Executes on button press in BGL.
function BGL_Callback(hObject, eventdata, handles)
set(handles.BGLField,'String','');
set(handles.TemperatureField,'String','');
set(handles.UBPField,'String','');
set(handles.LBPField,'String','');
set(handles.PulseRateField,'String','');
set(handles.BPStatusField,'String','');
set(handles.BGStatusField,'String','');
%Import trained Neural Network
%Blood Glucose Network
ListOfVariables1 = load('cnn-lm-bg.mat'); 
handles.net1 = ListOfVariables1.net;
%Temperature Network
ListOfVariables2 = load('cnn-lm-temp.mat');
handles.net2 = ListOfVariables2.net;
%Upper Blood Pressure Network
ListOfVariables3 = load('cnn-lm-ubp.mat');
handles.net3 = ListOfVariables3.net;
%Lower Blood Pressure Network
ListOfVariables4 = load('cnn-lm-lbp.mat');
handles.net4 = ListOfVariables4.net;
%Pulse Rate Network
ListOfVariables5 = load('cnn-lm-pulse.mat');
handles.net5 = ListOfVariables5.net;
guidata(hObject,handles); 

csvfile = get(handles.FilenameField,'String');
S = csvread(csvfile,3,16,[3 16 3 1647]);
S = S';

%Read the excel file (glucose)
c = S;
s1=std(c);                       %standard deviation
ma1=max(c);                      %maximum
mi1=min(c);                      %minimum
m1=mean(c,1);                    %mean
sample1=[s1;ma1;mi1;m1];

%Read the excel file (temperature)
d = S;
s2=std(d);                       %standard deviation
ma2=max(d);                      %maximum
mi2=min(d);                      %minimum
m2=mean(d,1);                    %mean
sample2=[s2;ma2;mi2;m2];

%Read the excel file (Upper Pressure)
e = S;
s3=std(e);                       %standard deviation
ma3=max(e);                      %maximum
mi3=min(e);                      %minimum
m3=mean(e,1);                    %mean
sample3=[s3;ma3;mi3;m3];

%Read the excel file (Lower Pressure)
f = S;
s4=std(f);                       %standard deviation
ma4=max(f);                      %maximum
mi4=min(f);                      %minimum
m4=mean(f,1);                    %mean
sample4=[s4;ma4;mi4;m4];

%Read the excel file (Pulse Rate)
g = S;
s5=std(g);                       %standard deviation
ma5=max(g);                      %maximum
mi5=min(g);                      %minimum
m5=mean(g,1);                    %mean
sample5=[s5;ma5;mi5;m5];

%Processed by NN
Result1 = sim(handles.net1,sample1);    %Blood Glucose Level
Result2 = sim(handles.net2,sample2);    %Temperature
Result3 = sim(handles.net3,sample3);    %Systolic Pressure
Result4 = sim(handles.net4,sample4);    %Diastolic Pressure
Result5 = sim(handles.net5,sample5);    %Pulse rate

result1 = str2num(sprintf('%0.4f',Result1));
result2 = str2num(sprintf('%0.4f',Result2));
result3 = str2num(sprintf('%0.4f',Result3));
result4 = str2num(sprintf('%0.4f',Result4));
result5 = str2num(sprintf('%0.4f',Result5));

%Get the content from popupmenu(Selection1)
contents = get(handles.Selection1,'String');
Selection1_Value = contents{get(handles.Selection1,'Value')};

switch Selection1_Value
    case 'Random'
        G = get(handles.Glucose,'Value');
        H = get(handles.Temperature,'Value');
        BP = get(handles.BloodPressure,'Value');
        P = get(handles.Pulserate,'Value');

        if G == 1
            set(handles.BGLField,'String',result1);
        end
        
        if H == 1
            set(handles.TemperatureField,'String',result2);
        end
        
        if BP == 1
            set(handles.UBPField,'String',result3);
            set(handles.LBPField,'String',result4);
        end
        
        if P == 1 
            set(handles.PulseRateField,'String',result5);
        end
        
        if (result1 <= 11.1)
            B = 'Normal';
            if (G ==1)
                set(handles.BGStatusField,'String',B);
            else
                set(handles.BGStatusField,'String','');
            end
        elseif (result1 > 11.1 )
            B = 'Diabetes';
            if (G ==1)
                set(handles.BGStatusField,'String',B);
            else
                set(handles.BGStatusField,'String','');
            end
        end
            
        if (result3 >= 140) || (result4 >= 90)
            A = 'High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
        elseif ((120 <= result3) && (result3 < 140)) && ((60 <= result4) && (result4 < 80))
            A = 'Pre-High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif ((90 <= result3) && (result3 < 120)) && ((80 <= result4) && (result4 < 90))
            A = 'Pre-High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif ((120 <= result3) && (result3 < 140)) && ((80 <= result4) && (result4 < 90))
            A = 'Pre-High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif ((90 <= result3) && (result3 < 120)) && ((60 <= result4) && (result4 < 80))
            A = 'Ideal';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif (result3 < 90) || (result4 < 60)
            A = 'Low';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end               
        end
                
        if (G == 0) && (H == 0) && (BP == 0) && (P == 0)
            set(handles.BGLField,'String',result1);
            set(handles.TemperatureField,'String',result2);
            set(handles.UBPField,'String',result3);
            set(handles.LBPField,'String',result4);
            set(handles.PulseRateField,'String',result5);
            set(handles.BGStatusField,'String',B);
            set(handles.BPStatusField,'String',A);
        end
                t = [datetime('now')];       %set current time
                DateString = datestr(t);     %convert to string
                
                N = load ('username.mat');
                NN = struct2cell(N);
                NNN = string(NN);
                
                Folder = sprintf('HomeBloodDetection/HomeRecord');
                
                dbfile = fullfile(Folder,sprintf('%s.s3db',NNN));
                conn = sqlite(dbfile,'connect');            
                colnames = {'DateTime','BGL','Temperature','Systolic','Diastolic',... 
                            'PulseRate','BGStatus','BPStatus'};
                insert(conn,'OverallRecordTable',colnames,{DateString,result1,result2,...
                                                    result3,result4,result5,B,...
                                                    A});
                                                
                insert(conn,'RandomTable',colnames,{DateString,result1,result2,...
                                                    result3,result4,result5,B,...
                                                    A}); 
               
                
    case 'Fasting / Before Meal'
        
        G = get(handles.Glucose,'Value');
        H = get(handles.Temperature,'Value');
        BP = get(handles.BloodPressure,'Value');
        P = get(handles.Pulserate,'Value');

        if G == 1
            set(handles.BGLField,'String',result1);
        end
        
        if H == 1
            set(handles.TemperatureField,'String',result2);
        end
        
        if BP == 1
            set(handles.UBPField,'String',result3);
            set(handles.LBPField,'String',result4);
        end
        
        if P == 1 
            set(handles.PulseRateField,'String',result5);
        end
        
        if (result1 < 5.6)
            B = 'Normal';
            if (G ==1)
                set(handles.BGStatusField,'String',B);
            else
                set(handles.BGStatusField,'String','');
            end
        elseif (5.6 <= result1) && (result1 < 7)
            B = 'Prediabetes';
            if (G ==1)
                set(handles.BGStatusField,'String',B);
            else
                set(handles.BGStatusField,'String','');
            end
        elseif (result1 >= 7 )
            B = 'Diabetes';
            if (G ==1)
                set(handles.BGStatusField,'String',B);
            else
                set(handles.BGStatusField,'String','');
            end
        end
            
        if (result3 >= 140) || (result4 >= 90)
            A = 'High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
        elseif ((120 <= result3) && (result3 < 140)) && ((60 <= result4) && (result4 < 80))
            A = 'Pre-High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif ((90 <= result3) && (result3 < 120)) && ((80 <= result4) && (result4 < 90))
            A = 'Pre-High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif ((120 <= result3) && (result3 < 140)) && ((80 <= result4) && (result4 < 90))
            A = 'Pre-High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif ((90 <= result3) && (result3 < 120)) && ((60 <= result4) && (result4 < 80))
            A = 'Ideal';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif (result3 < 90) || (result4 < 60)
            A = 'Low';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end               
        end
                
        if (G == 0) && (H == 0) && (BP == 0) && (P == 0)
            set(handles.BGLField,'String',result1);
            set(handles.TemperatureField,'String',result2);
            set(handles.UBPField,'String',result3);
            set(handles.LBPField,'String',result4);
            set(handles.PulseRateField,'String',result5);
            set(handles.BGStatusField,'String',B);
            set(handles.BPStatusField,'String',A);
        end
                t = [datetime('now')];       %set current time
                DateString = datestr(t);     %convert to strin
                
                N = load ('username.mat');
                NN = struct2cell(N);
                NNN = string(NN);
                
                Folder = sprintf('HomeBloodDetection/HomeRecord');
                
                dbfile = fullfile(Folder,sprintf('%s.s3db',NNN));
                conn = sqlite(dbfile,'connect');            
                colnames = {'DateTime','BGL','Temperature','Systolic','Diastolic',... 
                            'PulseRate','BGStatus','BPStatus'};
                insert(conn,'OverallRecordTable',colnames,{DateString,result1,result2,...
                                                    result3,result4,result5,B,...
                                                    A});
                                                
                insert(conn,'FastingTable',colnames,{DateString,result1,result2,...
                                                    result3,result4,result5,B,...
                                                    A}); 
                
                
    case 'Two(2) Hours After Meal'
        
        G = get(handles.Glucose,'Value');
        H = get(handles.Temperature,'Value');
        BP = get(handles.BloodPressure,'Value');
        P = get(handles.Pulserate,'Value');

        if G == 1
            set(handles.BGLField,'String',result1);
        end
        
        if H == 1
            set(handles.TemperatureField,'String',result2);
        end
        
        if BP == 1
            set(handles.UBPField,'String',result3);
            set(handles.LBPField,'String',result4);
        end
        
        if P == 1 
            set(handles.PulseRateField,'String',result5);
        end
        
        if (result1 < 7.8)
            B = 'Normal';
            if (G ==1)
                set(handles.BGStatusField,'String',B);
            else
                set(handles.BGStatusField,'String','');
            end
        elseif (7.8 <= result1) && (result1 < 11)
            B = 'Prediabetes';
            if (G ==1)
                set(handles.BGStatusField,'String',B);
            else
                set(handles.BGStatusField,'String','');
            end
        elseif (result1 >= 11 )
            B = 'Diabetes';
            if (G ==1)
                set(handles.BGStatusField,'String',B);
            else
                set(handles.BGStatusField,'String','');
            end
        end
            
        if (result3 >= 140) || (result4 >= 90)
            A = 'High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
        elseif ((120 <= result3) && (result3 < 140)) && ((60 <= result4) && (result4 < 80))
            A = 'Pre-High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif ((90 <= result3) && (result3 < 120)) && ((80 <= result4) && (result4 < 90))
            A = 'Pre-High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif ((120 <= result3) && (result3 < 140)) && ((80 <= result4) && (result4 < 90))
            A = 'Pre-High';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif ((90 <= result3) && (result3 < 120)) && ((60 <= result4) && (result4 < 80))
            A = 'Ideal';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end
                    
        elseif (result3 < 90) || (result4 < 60)
            A = 'Low';
            if (BP ==1)
               set(handles.BPStatusField,'String',A);
            else
               set(handles.BPStatusField,'String','');
            end               
        end
                
        if (G == 0) && (H == 0) && (BP == 0) && (P == 0)
            set(handles.BGLField,'String',result1);
            set(handles.TemperatureField,'String',result2);
            set(handles.UBPField,'String',result3);
            set(handles.LBPField,'String',result4);
            set(handles.PulseRateField,'String',result5);
            set(handles.BGStatusField,'String',B);
            set(handles.BPStatusField,'String',A);
        end
                t = [datetime('now')];       %set current time
                DateString = datestr(t);     %convert to string
                
                N = load ('username.mat');
                NN = struct2cell(N);
                NNN = string(NN);
                
              
                Folder = sprintf('HomeBloodDetection/HomeRecord');
                
                dbfile = fullfile(Folder,sprintf('%s.s3db',NNN));
                conn = sqlite(dbfile,'connect');            
                colnames = {'DateTime','BGL','Temperature','Systolic','Diastolic',... 
                            'PulseRate','BGStatus','BPStatus'};
                insert(conn,'OverallRecordTable',colnames,{DateString,result1,result2,...
                                                    result3,result4,result5,B,...
                                                    A});
                                                
                insert(conn,'AfterMealTable',colnames,{DateString,result1,result2,...
                                                    result3,result4,result5,B,...
                                                    A}); 
                
                

end

function BRange_Callback(hObject, eventdata, handles)
StandardRange

% --- Executes on button press in Glucose.
function Glucose_Callback(hObject, eventdata, handles)
% hObject    handle to Glucose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Glucose


% --- Executes on button press in Temperature.
function Temperature_Callback(hObject, eventdata, handles)
% hObject    handle to Temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Temperature


% --- Executes on button press in BloodPressure.
function BloodPressure_Callback(hObject, eventdata, handles)
% hObject    handle to BloodPressure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of BloodPressure


% --- Executes on button press in Pulserate.
function Pulserate_Callback(hObject, eventdata, handles)
% hObject    handle to Pulserate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Pulserate



function text2_Callback(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text2 as text
%        str2double(get(hObject,'String')) returns contents of text2 as a double


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function FilenameField_Callback(hObject, eventdata, handles)
% hObject    handle to FilenameField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FilenameField as text
%        str2double(get(hObject,'String')) returns contents of FilenameField as a double


% --- Executes during object creation, after setting all properties.
function FilenameField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FilenameField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

