function varargout = UserRegisterpage(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UserRegisterpage_OpeningFcn, ...
                   'gui_OutputFcn',  @UserRegisterpage_OutputFcn, ...
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


% --- Executes just before UserRegisterpage is made visible.
function UserRegisterpage_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for UserRegisterpage
handles.output = hObject;
axes(handles.UMPLogo)
imshow('UMP PAHANG.png')
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = UserRegisterpage_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;



function Name_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of Name as text
%        str2double(get(hObject,'String')) returns contents of Name as a double


% --- Executes during object creation, after setting all properties.
function Name_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Password_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of Password as text
%        str2double(get(hObject,'String')) returns contents of Password as a double


% --- Executes during object creation, after setting all properties.
function Password_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NameField_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of NameField as text
%        str2double(get(hObject,'String')) returns contents of NameField as a double


% --- Executes during object creation, after setting all properties.
function NameField_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PasswordField_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of PasswordField as text
%        str2double(get(hObject,'String')) returns contents of PasswordField as a double


% --- Executes during object creation, after setting all properties.
function PasswordField_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Back_Login.
function Back_Login_Callback(hObject, eventdata, handles)
HomeLoginUser
close(UserRegisterpage)


% --- Executes on button press in Register.
function Register_Callback(hObject, eventdata, handles)
    A = get(handles.NameField,'String');
    B = get(handles.PasswordField,'String');
    dbfile = fullfile('HomeBloodDetection','HomeUserList.s3db');
    conn = sqlite(dbfile,'connect')
    colnames = {'UserName','Password'};
    if isempty(A) || isempty(B)
       msgbox('Please complete details.');
    elseif (length(B) < 6)
        msgbox('Please enter password at least six(6) letters/digits/symbols.')
    else
        Username = fetch(conn,'SELECT UserName FROM HomeUserList');
        Name = Username;

        validUser = false;

        for j=1 : length(Name)
            User_name = Username{j,1};
            if strcmpi(User_name,A)
               validUser = true;
               break;
            end
        end
        
    if validUser
        msgbox('Username is already existed in the list.Please use another name.');    
    else
       insert(conn,'HomeUserList',colnames,{A,B})
       msgbox('Registered successfully');
    end
    end
