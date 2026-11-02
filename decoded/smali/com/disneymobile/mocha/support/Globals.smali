.class public Lcom/disneymobile/mocha/support/Globals;
.super Ljava/lang/Object;
.source "Globals.java"


# static fields
.field public static final kMethodInvokeExceptionErrorCode:I = -0x834

.field public static final kMochaDomain:Ljava/lang/String; = "kMochaDomain"

.field public static final kMochaDomainPrefix:Ljava/lang/String; = "DMOMF"

.field public static final kNSErrorExceptionKey:Ljava/lang/String; = "kNSErrorExceptionKey"

.field public static final kNSErrorJavaExceptionDomain:Ljava/lang/String; = "kNSErrorJavaExceptionDomain"

.field public static final kNSErrorLocalizedFailureReasonErrorKey:Ljava/lang/String; = "kNSErrorLocalizedFailureReasonErrorKey"

.field public static final kNSErrorUnexpectedParameterException:I = -0x3e8

.field public static final kNSErrorUnexpectedRuntimeException:I = -0x3e9

.field public static final kNSFileManagerDeleteDirectoryErrorCode:I = -0x7d1

.field public static final kNSFileManagerDeleteItemErrorCode:I = -0x7d0

.field public static final kNSFileManagerPathDoesNotExistErrorCode:I = -0x7d2

.field public static final kNSFileManagerPathIsNotDirectoryErrorCode:I = -0x7d3

.field public static final kSelectorTryResolveSelectorByValuesErrorCode:I = -0x835


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs logMochaFoundationError([Ljava/lang/Object;)V
    .locals 6
    .param p0, "parameters"    # [Ljava/lang/Object;

    .prologue
    .line 39
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "[DMOMF] "

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 41
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 42
    .local v3, "object":Ljava/lang/Object;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4, v3}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    .line 41
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 45
    .end local v3    # "object":Ljava/lang/Object;
    :cond_0
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4}, Ljava/io/PrintStream;->println()V

    .line 46
    return-void
.end method
