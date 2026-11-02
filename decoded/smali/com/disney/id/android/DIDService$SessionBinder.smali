.class public Lcom/disney/id/android/DIDService$SessionBinder;
.super Landroid/os/Binder;
.source "DIDService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SessionBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDService;


# direct methods
.method public constructor <init>(Lcom/disney/id/android/DIDService;)V
    .locals 0

    .prologue
    .line 76
    iput-object p1, p0, Lcom/disney/id/android/DIDService$SessionBinder;->this$0:Lcom/disney/id/android/DIDService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public getService()Lcom/disney/id/android/DIDService;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/disney/id/android/DIDService$SessionBinder;->this$0:Lcom/disney/id/android/DIDService;

    return-object v0
.end method
