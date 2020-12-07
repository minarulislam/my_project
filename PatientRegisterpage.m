function varargout = PatientRegisterpage(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PatientRegisterpage_OpeningFcn, ...
                   'gui_OutputFcn',  @PatientRegisterpage_OutputFcn, ...
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


% --- Executes just before Registerpage is made visible.
function PatientRegisterpage_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for Registerpage
handles.output = hObject;
axes(handles.UMPLogo)
imshow('UMP PAHANG.png')
% Update handles structure
guidata(hObject, handles);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% Hint: delete(hObject) closes the figure
HospitalLogin
close(PatientRegisterpage)
delete(hObject);


% --- Outputs from this function are returned to the command line.
function varargout = PatientRegisterpage_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


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


function edit3_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ICorPassport_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of ICorPassport as text
%        str2double(get(hObject,'String')) returns contents of ICorPassport as a double


% --- Executes during object creation, after setting all properties.
function ICorPassport_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Register.
function Register_Callback(hObject, eventdata, handles)
D = load ('Doctorname.mat');
DD = struct2cell(D);
DDD = string(DD);

I = load ('ID.mat');
II = struct2cell(I);
III = string(II);
    %Get content from edit box
    A = get(handles.edit3,'String');
    B = get(handles.ICorPassport,'String');
    
    DoctorFolder = sprintf('HospitalBloodDetection/%s(%s)',DDD,III);
    %connect to database
    dbfile = fullfile(DoctorFolder,'PatientList.s3db');
    conn = sqlite(dbfile,'connect');
    colnames = {'PatientName','ICorPassport'};
    if isempty(A) || isempty(B)
       msgbox('Please complete details.');   
    elseif ((length(B)>12) || (length(B) < 8))
       msgbox('Please enter IC or Passport number properly.');
    else
        PatientID = fetch(conn,'SELECT ICorPassport FROM PatientList');
        IC = PatientID;

        validUser = false;
        %Compare content
        for j=1 : length(IC)
            ID = PatientID{j,1};
            if strcmpi(ID,B)
               validUser = true;
               break;
            end
         end
    
    if validUser
        msgbox('IC is already existed in the list.Please check.');
    else
        insert(conn,'PatientList',colnames,{A,B})
        msgbox('Successfully registered.');
    end
    end
close(conn)

% --- Executes on button press in Login.
function Login_Callback(hObject, eventdata, handles)
HospitalLogin
close(PatientRegisterpage)


% --- Executes on button press in Checklist.
function Checklist_Callback(hObject, eventdata, handles)
PatientList


% --- Executes during object creation, after setting all properties.
function Login_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function Checklist_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function Register_CreateFcn(hObject, eventdata, handles)


% --- Executes during object deletion, before destroying properties.
function text3_DeleteFcn(hObject, eventdata, handles)
