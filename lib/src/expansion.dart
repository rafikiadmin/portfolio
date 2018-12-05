import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/focus/focus.dart';
import 'package:angular_components/laminate/components/modal/modal.dart';
import 'package:angular_components/laminate/overlay/module.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_dialog/material_dialog.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel_auto_dismiss.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel_set.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_yes_no_buttons/material_yes_no_buttons.dart';
import 'package:angular_components/model/action/async_action.dart';

class MaterialExpansionPanelGalleryConfig {}

@Component(
  selector: 'expansion',
  providers: [overlayBindings],
  directives: [
    AutoFocusDirective,
    MaterialIconComponent,
    MaterialButtonComponent,
    MaterialExpansionPanel,
    MaterialExpansionPanelAutoDismiss,
    MaterialExpansionPanelSet,
    MaterialDialogComponent,
    MaterialInputComponent,
    materialInputDirectives,
    MaterialYesNoButtonsComponent,
    ModalComponent,
    NgModel,
  ],
  templateUrl: 'expansion.html',
  preserveWhitespace: true,
)
class MaterialExpansionComponent {
  String name = 'Test';
  bool isCustomToolBeltPanelExpanded = true;

  bool showConfirmation = false;
  Completer<bool> dialogFutureCompleter;

  void showConfirmationDialog(AsyncAction event) {
    showConfirmation = true;
    dialogFutureCompleter = Completer();
    event.cancelIf(dialogFutureCompleter.future);
  }

  void closeDialog(bool proceed) {
    showConfirmation = false;
    if (dialogFutureCompleter != null) {
      dialogFutureCompleter.complete(!proceed);
    }
  }
}