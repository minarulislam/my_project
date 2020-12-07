function varargout = ChooseUser(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChooseUser_OpeningFcn, ...
                   'gui_OutputFcn',  @ChooseUser_OutputFcn, ...
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


% --- Executes just before ChooseUser is made visible.
function ChooseUser_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for ChooseUser
handles.output = hObject;
axes(handles.UMPLogo)
imshow('UMP PAHANG.png')    %show UMP Logo
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = ChooseUser_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Hospital.
function Hospital_Callback(hObject, eventdata, handles)
%create folder 
dir = fullfile('HospitalBloodDetection');
    if ~exist('HospitalBloodDetection')
        mkdir HospitalBloodDetection
    end
%create database for hospital user
dbfile = fullfile('HospitalBloodDetection','DoctorList.s3db');
    if ~exist(dbfile) 
        conn = sqlite(dbfile,'create')
        createTable1 = ['create table DoctorList','(DoctorName VARCHAR, DoctorID VARCHAR)'];
        exec(conn,createTable1);  
    end
%Go to Doctor Login Page
DoctorLoginpage     
close(ChooseUser)


% --- Executes on button press in Home.
function Home_Callback(hObject, eventdata, handles)
%create folder
dir = fullfile('HomeBloodDetection');
    if ~exist('HomeBloodDetection')
        mkdir HomeBloodDetection
    end
%create database for home user
dbfile = fullfile('HomeBloodDetection','HomeUserList.s3db');
    if ~exist(dbfile) 
        conn = sqlite(dbfile,'create')
        createTable2 = ['create table HomeUserList','(UserName VARCHAR, Password VARCHAR)'];
        exec(conn,createTable2);  
    end
%Go to Home User Login Page
HomeLoginUser    
close(ChooseUser)


% --- Executes during object creation, after setting all properties.
function UMPLogo_CreateFcn(hObject, eventdata, handles)
