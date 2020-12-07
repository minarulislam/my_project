function varargout = PatientList(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PatientList_OpeningFcn, ...
                   'gui_OutputFcn',  @PatientList_OutputFcn, ...
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


% --- Executes just before PatientList is made visible.
function PatientList_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for PatientList
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

D = load ('Doctorname.mat');
DD = struct2cell(D);
DDD = string(DD);

I = load ('ID.mat');
II = struct2cell(I);
III = string(II);

DoctorFolder = sprintf('HospitalBloodDetection/%s(%s)',DDD,III);
%connect to database and get the content
dbfile = fullfile(DoctorFolder,'PatientList.s3db');
conn = sqlite(dbfile,'connect')  
List = fetch(conn,'SELECT * FROM PatientList');
%show the content in table
set(handles.PatientList,'Data', List);

% --- Outputs from this function are returned to the command line.
function varargout = PatientList_OutputFcn(hObject, eventdata, handles)
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% Hint: delete(hObject) closes the figure
PatientRegisterpage
close(PatientList)
delete(hObject);
