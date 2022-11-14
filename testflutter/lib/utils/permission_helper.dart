import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
class PermissionHelper{
  // onSuccess : 同意
  // onFailed : 其中一个不同意
  // onOpenSetting 需要去设置
  static VoidCallback defaultCall = () {};

///检测权限状态
  static void checkSelfPermission(Permission permission,
      {String? errMsg,
      Function? onSuccess,
      VoidCallback? onFailed,
      VoidCallback? onOpenSetting}) async {
    var status = await permission.status;
    if (status.isGranted) {
      debugPrint('permission=======isGranted');
      if(onSuccess!=null){
        debugPrint('permission=======isGranted1');
        onSuccess.call();
      }
      // onSuccess != null ? onSuccess.call() : defaultCall();
    } else if (status.isDenied) {
      debugPrint('permission=======isDenied');
      onFailed != null ? onFailed() : defaultCall();
    } else if (status.isPermanentlyDenied) {
      debugPrint('permission=======isPermanentlyDenied');
      onOpenSetting != null ? onOpenSetting() : defaultCall();
    } else if (status.isRestricted || status.isLimited) {
      debugPrint('permission=======isRestricted');
      onOpenSetting != null ? onOpenSetting() : defaultCall();
    }
  }
///申请权限
  static void requestPermission(Permission permission,
      {String? errMsg,
      VoidCallback? onSuccess,
      VoidCallback? onFailed,
      VoidCallback? onOpenSetting}) async {
    final request = await permission.request();
    if (request.isGranted) {
      onSuccess != null ? onSuccess() : defaultCall();
    } else if (request.isDenied) {
      // debugPrint('permission=======isRestricted12');
      onFailed != null ? onFailed() : defaultCall();
    } else if (request.isPermanentlyDenied) {
      // debugPrint('permission=======isPermanentlyDenied12');
      onOpenSetting != null ? onOpenSetting() : defaultCall();
    } else if (request.isRestricted || request.isLimited) {
      // debugPrint('permission=======isRestricted1223');
      onOpenSetting != null ? onOpenSetting() : defaultCall();
    }
  }
  static void checkPermission(Permission permission,
      {String? errMsg,
      VoidCallback? onSuccess,
      VoidCallback? onFailed,
      VoidCallback? onOpenSetting}) async {
    // var status = await permission.status;
    // if (status.isGranted) {
    //   onSuccess != null ? onSuccess() : defaultCall();
    // } else if (status.isDenied) {
    final request = await permission.request();
    if (request.isGranted) {
      onSuccess != null ? onSuccess() : defaultCall();
    } else if (request.isDenied) {
      // debugPrint('permission=======isRestricted12');
      onFailed != null ? onFailed() : defaultCall();
    } else if (request.isPermanentlyDenied) {
      // debugPrint('permission=======isPermanentlyDenied12');
      onOpenSetting != null ? onOpenSetting() : defaultCall();
    } else if (request.isRestricted || request.isLimited) {
      // debugPrint('permission=======isRestricted1223');
      onOpenSetting != null ? onOpenSetting() : defaultCall();
    }
    // } else if (status.isPermanentlyDenied) {
    //   onOpenSetting != null ? onOpenSetting() : defaultCall();
    // }else if(status.isRestricted||status.isLimited){
    //    onOpenSetting != null ? onOpenSetting() : defaultCall();
    // }
  }
  ///检查权限
  static void check(List<Permission> permissionList,
      {String? errMsg,
        VoidCallback? onSuccess,
        VoidCallback? onFailed,
        VoidCallback? onOpenSetting}) async {
    // bool flag = true;
    List<Permission> needRequestPermissionList=[];
    List<Permission> permanentlyDeniedPermissionList=[];
    for (var value in permissionList) {
      var status = await value.status;
      if(status.isDenied){
        needRequestPermissionList.add(value);
      }else if(status.isPermanentlyDenied){
        permanentlyDeniedPermissionList.add(value);
      }
      // if (!status.isGranted) {
      //   flag = false;
      //   break;
      // }
    }
    if (needRequestPermissionList.isEmpty &&
        permanentlyDeniedPermissionList.isEmpty) {
      onSuccess != null ? onSuccess() : defaultCall();
    } else if (needRequestPermissionList.isNotEmpty) {
      PermissionStatus permissionStatus =
          await requestPermissions(needRequestPermissionList);
      if (permissionStatus.isGranted) {
        onSuccess != null ? onSuccess() : defaultCall();
      } else if (permissionStatus.isDenied) {
        onFailed != null ? onFailed() : defaultCall();
      } else if (permissionStatus.isPermanentlyDenied) {
        //仅安卓上
        onOpenSetting != null ? onOpenSetting() : defaultCall();
      } else if (permissionStatus.isRestricted || permissionStatus.isLimited) {
        //表示允许有限使用该资源。
        //IOS单独处理
        onOpenSetting != null ? onOpenSetting() : defaultCall();
      }
    } else if (permanentlyDeniedPermissionList.isNotEmpty) {
      onOpenSetting != null ? onOpenSetting() : defaultCall();
    }

    // if (!flag) {
      // PermissionStatus permissionStatus =
      // await requestPermission(permissionList);
      // if (permissionStatus.isGranted) {
      //   onSuccess != null ? onSuccess() : defaultCall();
      // } else if (permissionStatus.isDenied) {
      //   onFailed != null ? onFailed() : defaultCall();
      // } else if (permissionStatus.isPermanentlyDenied) {
      //   //仅安卓上
      //   onOpenSetting != null ? onOpenSetting() : defaultCall();
      // } else if (permissionStatus.isRestricted) {//表示允许有限使用该资源。
      //   //IOS单独处理
      //   onOpenSetting != null ? onOpenSetting() : defaultCall();
      // } else if (permissionStatus.isLimited) {
      //   //IOS单独处理
      //   onOpenSetting != null ? onOpenSetting() : defaultCall();
      // }
    // }
  }

  //申请权限
  static Future<PermissionStatus> requestPermissions(
      List<Permission> permissionList) async {
    Map<Permission, PermissionStatus> statuses = await permissionList.request();
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    statuses.forEach((key, value) {
      if (!value.isGranted) {
        currentPermissionStatus = value;
        return;
      }
    });
    return currentPermissionStatus;
  }
}
