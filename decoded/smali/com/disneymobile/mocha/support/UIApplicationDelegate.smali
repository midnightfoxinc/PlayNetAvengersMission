.class public interface abstract Lcom/disneymobile/mocha/support/UIApplicationDelegate;
.super Ljava/lang/Object;
.source "UIApplicationDelegate.java"


# virtual methods
.method public abstract applicationDidFailToRegisterForRemoteNotificationsWithError(Lcom/disneymobile/mocha/support/UIApplication;Lcom/disneymobile/mocha/NSError;)V
.end method

.method public abstract applicationDidFinishLaunchingWithOptions(Lcom/disneymobile/mocha/support/UIApplication;Ljava/util/HashMap;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/UIApplication;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation
.end method

.method public abstract applicationDidReceiveRemoteNotification(Lcom/disneymobile/mocha/support/UIApplication;Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/UIApplication;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract applicationDidRegisterForRemoteNotificationsWithDeviceToken(Lcom/disneymobile/mocha/support/UIApplication;Ljava/lang/String;)V
.end method

.method public abstract applicationHandleOpenURL(Lcom/disneymobile/mocha/support/UIApplication;Lcom/disneymobile/mocha/NSURL;)Z
.end method
