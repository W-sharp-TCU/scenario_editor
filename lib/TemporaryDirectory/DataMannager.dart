import 'package:scenario_editor/TemporaryDirectory/ContextData.dart';

class DataManager {
  List<ContextData> dataList = [];
  List<int> mappingTable = [];


  int addSpeechContext (int index, String text, List<int> goto) {
    dataList.add(ContextData.speech(index: index, text: text, goto: goto));
    _changeEntryOfMappingTable(index, dataList.length-1);
    return dataList.length;
  }

  int addQuestionContext (int index, List<String> option, List<int> goto) {
    dataList.add(ContextData.question(index: index, option: option, goto: goto));
    _changeEntryOfMappingTable(index, dataList.length-1);
    return dataList.length;
  }

  int addStatusUpContext (int index, List<int> statusName, List<int> gain, List<int> goto) {
    dataList.add(ContextData.statusUp(index: index, statusName: statusName, gain: gain, goto: goto));
    _changeEntryOfMappingTable(index, dataList.length-1);
    return dataList.length;
  }

  ContextData getInstance (int index) {
    return dataList[mappingTable[index]];
  }

  void deleteData (int index) {
    dataList.remove(getInstance(mappingTable[index]));
    _deleteEntryOfMappingTable(index);
  }

  void _changeEntryOfMappingTable(int index, int entry) {
    // append
    while(index > mappingTable.length-1) {
      mappingTable.add(-1);
    }
    mappingTable[index] = entry;
  }

  void _deleteEntryOfMappingTable(int deleteIndex) {
    mappingTable[deleteIndex] = -1;
    for (int i=deleteIndex+1; i<mappingTable.length; i++) {
      if (mappingTable[i] != -1) {
        mappingTable[i] = mappingTable[i] - 1;
      }
    }
  }
}